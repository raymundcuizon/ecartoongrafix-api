const HTTPStatus = require('http-status');
const Images = require('../models/Images');
const Process = require('../models/Process');
const ProcessSteps = require('../models/ProcessSteps');
const config = require('../../config/');

const sequelize = require('../../config/database');
const Sequelize = require('sequelize');

const fs = require('fs-extra');
const random = require('random-string-generator');
const _ = require('underscore');
const lodash = require('lodash');
const slugify = require('slugify')

const utils = require('../services/utils.service');
const ProcessController = () => {

	const getSingle = async (req, res) => {

		try {

			const { slug } = req.params;

			const process = await Process.findOne({
            where: {
							[Sequelize.Op.or]: [{id: slug}, {slug: slug}]
            },
						attributes: ['id','slug','name','description']
          });

      if(!process) {
      		return res.status(400).json({ msg: 'Bad Request: Model not found' });
      }


			let steps = await sequelize.query("SELECT ps.id, ps.step, ps.status, images.title, images.description,\
					concat('"+config.api_url+"','/process/',images.folder_name ,'/', images.filename) as img_url \
					FROM process_steps as ps LEFT JOIN images ON ps.image_id = images.id\
					where ps.status = 1 AND ps.deleted = 0 AND ps.process_id = ? order by ps.step",
        	{replacements: [ process.id ],type: sequelize.QueryTypes.SELECT });

			return res.status(HTTPStatus.OK).json( {steps} );
		} catch (err) {
			return res.status(HTTPStatus.BAD_REQUEST).json({ msg: 'invalid request' });

		}

	}

	const getlist = async (req, res, next) => {
		try {

			let datalist = await sequelize.query(`
					SELECT process.id
						, process.status
						, process.slug
						, process.name
						, process.description
						, process.sequence
						, concat('${config.api_url}','/process/',images.folder_name ,'/', images.filename) as img_url
						FROM process LEFT JOIN images ON process.banner = images.id WHERE process.status = 1 ORDER BY process.sequence ASC
				`,
        { type: sequelize.QueryTypes.SELECT });

				var docs_data = [];

				var result = new Promise((resolve, reject) => {
					datalist.forEach( async (value,index, array) => {
						const steps = await sequelize.query(`
							SELECT ps.id
								, ps.step
								, ps.status
								, images.title
								, images.description
								, concat('${config.api_url}','/process/',images.folder_name ,'/', images.filename) as img_url
								FROM process_steps as ps LEFT JOIN images ON ps.image_id = images.id
								WHERE ps.status = 1 AND ps.deleted = 0 AND ps.process_id = ? order by ps.step
							`, {replacements: [ value.id ],type: sequelize.QueryTypes.SELECT });


							docs_data.push({
								id : value.id,
								status : value.status,
								slug : value.slug,
								name : value.name,
								description : value.description,
								sequence : value.sequence,
								img_url : value.img_url,
								steps : steps
							})

							if(index === array.length -1) {
								resolve()
							}

					})
				})

				result.then(() => {
					return res.status(HTTPStatus.OK).json( { datalist : docs_data } );

				});

		} catch (err) {
			err.status = HTTPStatus.BAD_REQUEST;
		    return next(err);
		}
	};

	const getlistPrivate = async (req, res, next) => {

		try {

			let condition = `SELECT process.id, process.status, process.slug, process.name, process.description,
			concat('${config.api_url}','/process/',images.folder_name ,'/', images.filename) as img_url
			FROM process LEFT JOIN images ON process.banner = images.id  where process.status = ? ORDER BY process.sequence asc
			`;
			let visible = await sequelize.query(condition,
        {replacements: [1], type: sequelize.QueryTypes.SELECT });

			let inVisible = await sequelize.query(condition,
				{replacements: [0], type: sequelize.QueryTypes.SELECT });


			return res.status(HTTPStatus.OK).json( { visible, inVisible } );
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

			});

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
				slug: slugify(body.name).toLowerCase(),
				name: body.name,
				description: body.description
			}, {
				transaction
			});

			await transaction.commit();

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
								process_id : body.process_id,
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
			return res.status(HTTPStatus.BAD_REQUEST).json(e);
		}
	}

	const stepSequence = async (req, res) => {

		utils.sequence(req, res, ProcessSteps);

	}

	const processSequence = async (req, res) => {

		utils.sequence(req, res, Process);

	}

	const update = async (req, res) => {

		try {

			const { id } = req.params;
			const { body } = req;

			let data = {
				'name': body.name,
				'description': body.description
			}

			const portfolio = await Process.update(data, {
				where : {
					id
				}
			});

			return res.status(HTTPStatus.ACCEPTED).json({msg: 'successfully updated'})

		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}
	};

	const visibility = async (req, res) => {

		utils.visibility(req, res, Process);

	}

	const visibilityStep = async (req, res) => {

		utils.visibility(req, res, ProcessSteps);

	}


	return {
		getSingle
		, getlist
		, create
		, createStep
		, update
		, visibility
		, visibilityStep
		, stepSequence
		, getlistPrivate
		, processSequence
	}

}



module.exports = ProcessController;
