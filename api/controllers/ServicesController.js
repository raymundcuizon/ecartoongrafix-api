/**
 * Post Controller
 */


const HTTPStatus = require('http-status');
const Services = require('../models/Services');
const { Op } = require('sequelize');

const ServicesController = () => {

	const getlist = async (req, res, next) => {
		try {

			const data = await Services.findOne({
				attributes: ['description']
			});

			return res.status(HTTPStatus.OK).json(data);

		} catch (err) {
			err.status = HTTPStatus.BAD_REQUEST;
		    return next(err);
		}
	};

	const update = async (req, res, next) => {

		try {
			const { body } = req;

			const updateData = await Services.findOne()

			const data = {
				description : body.description
			}

			const about = await updateData.update(data);

			return res.status(HTTPStatus.CREATED).json(about.toJSON());

		} catch (e) {

			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};


	return {
		getlist,
		update
	}
}

module.exports = ServicesController;
