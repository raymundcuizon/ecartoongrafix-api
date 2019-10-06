/**
 * Post Controller
 */


const HTTPStatus = require('http-status');
const Faq = require('../models/Faq');
const { Op } = require('sequelize');

const FaqController = () => {

	const getlist = async (req, res, next) => {
		try {

			const data = await Faq.findAll({
				attributes : [
					'id', 'title', 'answer', 'question', 'status'
				]
			})

			return res.status(HTTPStatus.OK).json(data);

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

			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};

	const update = async (req, res) => {

		try {

			const { id } = req.params;
			const { body } = req;

			let data = {
				'title': body.title,
				'question': body.question,
				'answer': body.answer
			}

			const faq = await Faq.update(data, {
				where : {
					id
				}
			});

			return res.status(HTTPStatus.ACCEPTED).json({msg: 'successfully updated'})

		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}

	};

	const destroy = async (req, res) => {
		try {

			const { id } = req.params;

			const faq = await Faq.destroy({
				where:{
					id
				}
			});

			return res.status(HTTPStatus.ACCEPTED).json({ msg: 'successfully deleted' });
		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}
	}

	const visibility = async (req, res) => {
		try {

			const { id } = req.params;

			const faq = await Faq.findByPk(id);

			let status = (faq.status) ? false : true;

			faq.update({ status });

			return res.status(HTTPStatus.OK).json({ msg : 'successfully updated visibility'});

		} catch (e) {
			return res.status(HTTPStatus.BAD_REQUEST).json(e);

		}
	}

	return {
		getlist,
		create,
		update,
		destroy,
		visibility
	}
}



module.exports = FaqController;
