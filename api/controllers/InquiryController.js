
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

const InquiryController = () => {

	const getlist = async (req, res, next) => {
		try {
			return res.status(HTTPStatus.OK).json("postsWithFavorite");
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
				contact_name : body.contact_name,
				company_name : body.company_name,
				phone_number : body.phone_number,
				website : body.website,
				project_name : body.project_name,
				license : body.license,
				illustration_usage : body.illustration_usage,
				client_type : body.client_type,
				final_graphic : body.final_graphic,
				deadline : body.deadline,
				project_about : body.project_about,
				cps_background : body.cps_background,
				budget : body.budget,
				project_usage : body.project_usage,
				targe_audience : body.targe_audience,
				colors : body.colors,
				look_feel : body.look_feel,
				font_lettering : body.font_lettering,
				etc : body.etc,
				// reference_photos : reference_photos,
			}
			if (!files || Object.keys(files).length === 0) {
				// return res.status(HTTPStatus.BAD_REQUEST).json({ msg : 'No files were uploaded.'});
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


	return {
		getlist,
		create
	}
}



module.exports = InquiryController;
