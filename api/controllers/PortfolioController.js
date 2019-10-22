const HTTPStatus = require('http-status');
const Images = require('../models/Images');
const Process = require('../models/Process');
const Portfolio = require('../models/Portfolio');
const PortfolioImages = require('../models/PortfolioImages');
const ProcessSteps = require('../models/ProcessSteps');
const Sequelize = require('sequelize');

const config = require('../../config/');

const { Op } = require('sequelize');
const sequelize = require('../../config/database');

const fs = require('fs-extra');
const random = require('random-string-generator');
const _ = require('underscore');
const lodash = require('lodash');
const slugify = require('slugify')

const image_file_path  = require('../../config/constant');
const utils = require('../services/utils.service');


const PortfolioController = () => {

	const getArtworks = async (req, res) => {

		try {

			const { slug } = req.params;
			const { page , paginate } = req.query;

			const portfolio = await Portfolio.findOne({
            where: {
							[Sequelize.Op.or]: [{id: slug}, {slug: slug}]
            },
						attributes: ['id','slug','name','description']
          });

      if(!portfolio) {
      		return res.status(400).json({ msg: 'Bad Request: Model not found' });
      }

			PortfolioImages.belongsTo(Images, {
				foreignKey: 'image_id'
			});

			const options = {
					page: +page, // Default 1
					paginate: +paginate, // Default 25
					attributes: [ 'id', 'image_id', 'status' ],
					where : {
						portfolio_id : portfolio.id
					},

					order: [
						['id', 'DESC']
					],
					include: [{
							model: Images,
							attributes: [
								'title',
								'description',
								'id',
								[ Sequelize.fn("concat", config.api_url + '/portfolio/',  Sequelize.col("folder_name"),'/',Sequelize.col("filename")), 'img_url' ]
							],
							required: false
					}],
			}

			const { docs, pages, total } = await PortfolioImages.paginate(options)

			var before = page > 1 ? +page - 1 : 1;
			var next   = page < total ? +page + 1 : total;

			if(docs.length === 0) {
				return res.status(HTTPStatus.OK).json( {
					"data_list" : docs , 'pagination' : { pages, total, before, next }
				} );
			}

			var docs_data = [];

			var artwork = new Promise( (resolve, reject) => {
					docs.forEach((value, index, array) => {

						docs_data.push({
							id: value.id,
							image_id: value.Image.dataValues.id,
							title: value.Image.dataValues.title,
							description: value.Image.dataValues.description,
							status: value.status,
							img_url: value.Image.dataValues.img_url
						})

						if(index === array.length -1) {
							resolve()
						}
					})
			});

			artwork.then(() => {
				return res.status(HTTPStatus.OK).json( {
					"data_list" : docs_data , 'pagination' : { pages, total, before, next }
				} );
			});

			// return res.status(HTTPStatus.OK).json( {
			// 	"data_list" : docs , 'pagination' : { pages, total, before, next }
			// } )

			// return res.status(HTTPStatus.OK).json( { portfolio_details: portfolio, images } );
		} catch (err) {
			console.log(err)
			return res.status(HTTPStatus.BAD_REQUEST).json({ msg: 'invalid request' });

		}

	}

	const getlist = async (req, res, next) => {

		try {

			const { page , paginate } = req.query;

			Portfolio.belongsTo(Images, {
				 foreignKey: 'thumbnail',
			 })

			const options = {
          page: +page, // Default 1
          paginate: +paginate, // Default 25
					attributes: [
						'id', 'name','slug', 'description', 'status'
					],
					order: [
						['created_at', 'DESC']
					],
					include: [
						{
							model: Images,
							litmi: 1,
							attributes: [
								[ Sequelize.fn("concat", config.api_url + '/portfolio/',  Sequelize.col("folder_name"),'/',Sequelize.col("filename")), 'img_url' ]
							],
							required: false
						}
					]
        }

			const { docs, pages, total } = await Portfolio.paginate(options)
			var before = page > 1 ? +page - 1 : 1;
			var next   = page < total ? +page + 1 : total;

			var docs_data = [];

			var prom = new Promise( (resolve, reject) => {
					docs.forEach((value, index, array) => {

						docs_data.push({
							id: value.id,
							name: value.name,
							description: value.description,
							status: value.status,
							img_url: value.Image.dataValues.img_url
						})

						if(index === array.length -1) {
							resolve()
						}
					})
			});

			prom.then(() => {
				return res.status(HTTPStatus.OK).json( {
					"data_list" : docs_data , 'pagination' : { pages, total, before, next }
				} );
			});

		} catch (err) {
			return res.status(HTTPStatus.BAD_REQUEST).json({ msg : err});

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

	const update = async (req, res) => {

		try {

			const { id } = req.params;
			const { body } = req;

			let data = {
				'name': body.name,
				'description': body.description
			}

			const portfolio = await Portfolio.update(data, {
				where : {
					id
				}
			});

			return res.status(HTTPStatus.ACCEPTED).json({msg: 'successfully updated'})

		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}
	};

	const updateArtwork = async (req, res) => {
		try {

			const { id } = req.params;
			const { body } = req;

			let data = {
				'title': body.title,
				'description': body.description
			}

			const portfolio = await Images.update(data, {
				where : {
					id
				}
			});

			return res.status(HTTPStatus.ACCEPTED).json({msg: 'successfully updated'})

		} catch (e) {
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

	const visibility = async (req, res) => {

		utils.visibility(req, res, Portfolio);

	}

	const visibilityArtwork = async (req, res) => {

		utils.visibility(req, res, PortfolioImages);

	}

	return {
		getArtworks
		, getlist
		, create
		, update
		, createArtwork
		, updateArtwork
		, visibility
		, visibilityArtwork

	}

}



module.exports = PortfolioController;
