const HTTPStatus = require('http-status');
const Images = require('../models/Images');
const Process = require('../models/Process');
const ProcessSteps = require('../models/ProcessSteps');

const { Op } = require('sequelize');
const sequelize = require('../../config/database');

const fs = require('fs-extra');
const random = require('random-string-generator');
const _ = require('underscore');
const lodash = require('lodash');

const ProcessController = () => {

	const getlist = async (req, res, next) => {
		try {

			let images = await sequelize.query('select id, title, description, CONCAT("images/process/",folder_name, "/", filename) as img_url\
			from images where category = 1 AND deleted = 0 AND status = 1',
        {type: sequelize.QueryTypes.SELECT });

			console.log(images)
			return res.status(HTTPStatus.OK).json( { images } );
		} catch (err) {
			err.status = HTTPStatus.BAD_REQUEST;
		    return next(err);
		}
	};

	const create_test = async (req, res, next) => {

		try {

			const { body, files } = req;

			if (!files || Object.keys(files).length === 0) {
				return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
		  }

			var counter = 1;
			let folder_name = random();

			let dir = './assets/images/process/'+ folder_name;
			fs.ensureDirSync(dir, { mode: 0o2775 });

      var result = new Promise((resolve, reject) => {

				Object.keys(files).forEach(function(value, index, array) {

					let split_mimetype = files[value].mimetype.split('/');
					let file_name = random() + '.' + split_mimetype[1]

					files[value].mv(dir + '/' + file_name, async function (err) {
						if (err){
							return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
						}

						let data = {
							title: body.title[counter]
							, description: body.description[counter]
							, filename: file_name
							, folder_name: folder_name
							, category: 1
						}

						await Images.create(data, { transaction });

					});

					if (index === array.length -1){
              resolve();
            }
				})
			});

			result.then(() => {
  			return res.status(HTTPStatus.CREATED).json({ msg : 'successfully created' });
		 });

		} catch (e) {
			console.log(e)
			return res.status(HTTPStatus.BAD_REQUEST).json(e);
		}

	};

	const create = async (req, res) => {

		var transaction;

		try {

			const { body, files } = req;


			if (!files || Object.keys(files).length === 0) {
				return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
			}
			transaction = await sequelize.transaction();

			let folder_name = random();

			let dir = './assets/images/process/'+ folder_name;
			fs.ensureDirSync(dir, { mode: 0o2775 });

			let split_mimetype = files.banner.mimetype.split('/');
			let file_name = random() + '.' + split_mimetype[1]

			files.banner.mv(dir + '/' + file_name, async function (err) {
				if (err){
					return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
				}

				let data = {
					title: null
					, description: null
					, filename: file_name
					, folder_name: folder_name
					, category: 1
				}

				const image = await Images.create(data, { transaction });

				await Process.create({
					banner: image.id,
					name: body.name,
					description: body.description
				}, {
					transaction
				});

				await transaction.commit();

			});

			return res.status(HTTPStatus.CREATED).json({ msg : 'successfully created' });

		} catch (e) {

			if (transaction) await transaction.rollback();
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};

	const createStep = async (req, res) => {

		try {

			const { body, files } = req;

			if (!files || Object.keys(files).length === 0) {
				return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
		  }

			var steps_data = [];
			var counter = 0;

			let folder_name = random();
			let dir = './assets/images/process/'+ folder_name;
			fs.ensureDirSync(dir, { mode: 0o2775 });

			var result = new Promise( (resolve, reject) => {

				Object.keys(files).forEach(function(value, index, array) {
					counter++
					let desc = _.find(body, function(v,k, array) {
            let x = 'desc_'+counter;
            return k == x
          });
					let title = _.find(body, function(v,k, array) {
            let x = 'title_'+counter;
            return k == x
          });
					let step = _.find(body, function(v,k, array) {
            let x = 'step_'+counter;
            return k == x
          });
					let split_mimetype = files[value].mimetype.split('/');
					let file_name = random() + '.' + split_mimetype[1];

					files[value].mv(dir + '/' + file_name, async function (err) {

							if(err){
								reject(err)
							}

							let data = {
								title: title
								, description: desc
								, filename: file_name
								, folder_name: folder_name
								, category: 2
							}

							const img = await Images.create(data);
							await ProcessSteps.create({
								process_id : 1,
								image_id: img.id,
								step : step
							});
					});
					if (index === array.length -1){
            resolve();
          }
				});
			});
			result.then(() => {
				return res.status(HTTPStatus.CREATED).json({ msg : 'successfully created' });
			});

		} catch (e) {
			console.log(e)
			if (transaction) await transaction.rollback();

			return res.status(HTTPStatus.BAD_REQUEST).json(e);
		}
	}

	return {
		getlist,
		create,
		createStep

	}
}



module.exports = ProcessController;
