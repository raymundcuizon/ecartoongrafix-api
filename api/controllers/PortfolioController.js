const HTTPStatus = require('http-status');
const Images = require('../models/Images');
const Process = require('../models/Process');
const Portfolio = require('../models/Portfolio');
const PortfolioImages = require('../models/PortfolioImages');
const ProcessSteps = require('../models/ProcessSteps');
const Sequelize = require('sequelize');

const { Op } = require('sequelize');
const sequelize = require('../../config/database');

const fs = require('fs-extra');
const random = require('random-string-generator');
const _ = require('underscore');
const lodash = require('lodash');
const slugify = require('slugify')

const PortfolioController = () => {

	const getArtworks = async (req, res) => {

		try {

			const { slug } = req.params;

			const portfolio = await Portfolio.findOne({
            where: {
                slug
            },
						attributes: ['id','slug','name','description']
          });

      if(!portfolio) {
      		return res.status(400).json({ msg: 'Bad Request: Model not found' });
      }


			let images = await sequelize.query("SELECT images.description,\
					concat(images.folder_name ,'/', images.filename) as img_url \
					FROM portfolio_images as ps LEFT JOIN images ON ps.image_id = images.id\
					where ps.status = 1 AND ps.deleted = 0 AND ps.portfolio_id = ? order by images.title",
        	{replacements: [ portfolio.id ],type: sequelize.QueryTypes.SELECT });

			return res.status(HTTPStatus.OK).json( { portfolio_details: portfolio, images } );
		} catch (err) {
			return res.status(HTTPStatus.BAD_REQUEST).json({ msg: 'invalid request' });

		}

	}

	const getlist = async (req, res, next) => {

		try {

			const { page , paginate } = req.query;
			// let page = 1;
			// let paginate = 10;

			Portfolio.belongsTo(Images, {
				 foreignKey: 'thumbnail',
			 })

			const options = {
          page: +page, // Default 1
          paginate: +paginate, // Default 25
					attributes: [
						'id', 'name','slug', 'description', 'status'
					],
					include: [
						{
							model: Images,
							attributes: [
								[Sequelize.fn("concat", Sequelize.col("folder_name"),'/',Sequelize.col("filename")), 'img_url']
							],
							required: false
						}
					]
        }
			const { docs, pages, total } = await Portfolio.paginate(options)
			var before = page > 1 ? +page - 1 : 1;
			var next   = page < total ? +page + 1 : total;

			return res.status(HTTPStatus.OK).json( {
				"data_list" : docs , 'pagination' : { pages, total, before, next }
			} );
		} catch (err) {
			err.status = HTTPStatus.BAD_REQUEST;
		    return next(err);
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

			let dir = './assets/images/portfolio/'+ folder_name;
			fs.ensureDirSync(dir, { mode: 0o2775 });

			// banner
			let split_mimetype = files.thumbnail.mimetype.split('/');
			let file_name = 'banner_'+ random() + '.' + split_mimetype[1]

			files.thumbnail.mv(dir + '/' + file_name, async function (err) {
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

			await Portfolio.create({
				name: body.name,
				slug: slugify(body.name).toLowerCase(),
				description: body.description,
				thumbnail: image.id,
			}, {
				transaction
			});

			await transaction.commit();

			return res.status(HTTPStatus.CREATED).json({ msg : 'successfully created' });

		} catch (e) {
			console.log(e);
			if (transaction) await transaction.rollback();
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};

	const createArtwork = async (req, res) => {

		try {

			const { body, files } = req;
			// return console.log(files);
			if (!files || Object.keys(files).length === 0) {
				return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
		  }

			var steps_data = [];
			var counter = 0;

			let folder_name = 'artwork_'  + random();
			let dir = './assets/images/portfolio/'+ folder_name;
			fs.ensureDirSync(dir, { mode: 0o2775 });

			var result = new Promise( (resolve, reject) => {

				Object.keys(files).forEach(function(value, index, array) {
					counter++
					let desc = _.find(body, function(v,k, array) {
            let x = 'desc_'+counter;
            return k == x
          });

					let split_mimetype = files[value].mimetype.split('/');
					let file_name = random() + '.' + split_mimetype[1];

					files[value].mv(dir + '/' + file_name, async function (err) {

							if(err){
								reject(err)
							}

							let data = {
								title: null
								, description: desc
								, filename: file_name
								, folder_name: folder_name
								, category: 3
							}

							const img = await Images.create(data);

							await PortfolioImages.create({
								portfolio_id : body.portfolio_id,
								image_id: img.id
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

	return {
		getArtworks,
		getlist,
		create,
		createArtwork
	}

}



module.exports = PortfolioController;
