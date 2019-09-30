const HTTPStatus = require('http-status');
const Images = require('../models/Images');
const { Op } = require('sequelize');
const sequelize = require('../../config/database');

const fs = require('fs-extra');
const random = require('random-string-generator');

const ImageController = () => {

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

	const create = async (req, res, next) => {

		try {

			const { body, files } = req;

			if (!files || Object.keys(files).length === 0) {
				return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
		  }

			var counter = 1;
			let folder_name = random();
			let cat = ''
			switch (body.category) {
				case 1:
					cat = 'process'
					break;
				default:

			}
			let dir = './assets/images/'+cat+'/'+ folder_name;
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
							, category: body.category
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
			if (transaction) await transaction.rollback();
			return res.status(HTTPStatus.BAD_REQUEST).json(e);
		}

	};

	return {
		getlist,
		create
	}
}



module.exports = ImageController;
