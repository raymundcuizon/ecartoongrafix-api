/**
 * Post Controller
 */


const HTTPStatus = require('http-status');
const Faq = require('../models/Faq');
const { Op } = require('sequelize');

const FaqController = () => {

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
			const { body } = req;

			const data = {
				title : body.title
				, question : body.question
				, answer : body.answer
			}

			const faq = await Faq.create(data);

			return res.status(HTTPStatus.CREATED).json(faq.toJSON());

		} catch (e) {
			// e.status = HTTPStatus.BAD_REQUEST;
			// return next(e);
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};


	return {
		getlist,
		create
	}
}



module.exports = FaqController;
