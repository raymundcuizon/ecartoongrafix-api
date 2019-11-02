
const HTTPStatus = require('http-status');
const Faq = require('../models/Faq');
const ContactUs = require('../models/ContactUs');
const Images = require('../models/Images');

const sequelize = require('../../config/database');

const fs = require('fs-extra');
const _ = require('underscore');
const lodash = require('lodash');
const slugify = require('slugify')

const random = require('random-string-generator');
const { Op } = require('sequelize');
var empty = require('is-empty');


const InquiryController = () => {

	const getlist = async (req, res, next) => {

		try {

			const { page , paginate } = req.query;

			const options = {
					page: +page, // Default 1
					paginate: +paginate, // Default 25
			}

			const { docs, pages, total } = await ContactUs.paginate(options)
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

	const create = async (req, res, next) => {

		try {
			const { body, files } = req;

			var reference_photos = [];
			let data = {
				contact_name : body.contact_name
				, company_name : body.company_name
				, phone_number : body.phone_number
				, website : body.website
				, email_address : body.email_address
				, project_name : body.project_name
				, license : body.license
				, illustration_usage : body.illustration_usage
				, client_type : body.client_type
				, final_graphic_print : body.final_graphic_print
				, final_graphic_web : body.final_graphic_web
				, final_graphic_apparel : body.final_graphic_apparel
				, final_graphic_other : body.final_graphic_other
				, project_about : body.project_about
				, cps_background : body.cps_background
				, project_usage : body.project_usage
				, target_audience : body.target_audience
				, colors : body.colors
				, look_feel : body.look_feel
				, positioning : body.positioning
				, font_lettering : body.font_lettering
				, etc : body.etc
			}
			if (!files || Object.keys(files).length === 0) {
				reference_photos = null
				data.reference_photos = reference_photos;
				const contact_us = await ContactUs.create(data);
				return res.status(HTTPStatus.CREATED).json(contact_us.toJSON());

			} else {
				var counter = 0;

				let folder_name = random();
				let dir = './assets/images/contact_us/'+ folder_name;
				fs.ensureDirSync(dir, { mode: 0o2775 });

				var result = new Promise((resolve, reject) => {
					Object.keys(files).forEach( async function(value, index, array) {
						counter++

						let split_mimetype = files[value].mimetype.split('/');
						let file_name = random() + '.' + split_mimetype[1];

						files[value].mv(dir + '/' + file_name,  function (err) {
							if(err){
								throw new Error("test error outside promise");
							}
						});

						let data = {
							title: null
							, description: null
							, filename: file_name
							, folder_name: folder_name
							, category: 3
						}

						const img = await Images.create(data);
						reference_photos.push(img.id);

						if (index === array.length -1){
	              resolve();
	          }
					})

				}).then( async () => {

					reference_photos = reference_photos.toString()
					reference_photos = '(' + reference_photos + ')';
					data.reference_photos = reference_photos;
					const contact_us = await ContactUs.create(data);
					return res.status(HTTPStatus.CREATED).json(contact_us.toJSON());

				});

			}

		} catch (e) {
			// e.status = HTTPStatus.BAD_REQUEST;
			// return next(e);
			console.log(e);
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};

	const get = async (req, res, next) => {
		try {

			const { id } = req.params;

			const data = await ContactUs.findOne({
				where: {
					id,
				},
			});

	 		if(empty(data)) {
	 			return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'Model not found'});
	 		}

			var image = [];
			if(data.reference_photos){
				image = await sequelize.query('select CONCAT("contact_us/", folder_name, "/", filename) as img_url from images where status = 1 AND id in ' + data.reference_photos,
		      { replacements: [], type: sequelize.QueryTypes.SELECT });
			}

			return res.status(HTTPStatus.OK).json({data, image});

		} catch (err) {
			err.status = HTTPStatus.BAD_REQUEST;
				return next(err);
		}
	};

	const markAsRead = async (req, res) => {
		try {

			const { id } = req.params;

			const read = await ContactUs.findByPk(id);

			const status = 2;

			read.update({ status });

			return res.status(HTTPStatus.OK).json({ msg : 'successfully updated visibility'});

		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}
	}

	return {
		getlist
		, create
		, get
		, markAsRead
	}
}



module.exports = InquiryController;
