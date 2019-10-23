const sequelize = require('../../config/database');
const Sequelize = require('sequelize');
const HTTPStatus = require('http-status');
const config = require('../../config/');

var utils = {
  sequence: async function(req, res, model) {
    var transaction;

      try {
        const { body } = req;

        transaction = await sequelize.transaction();

        body.forEach( async (value, index, array) => {

          const portfolio = await model.update( { sequence : value.sequence, status : value.status }, {
            where : {
              id : value.id
            }
          }, {
            transaction
          });
        })

        await transaction.commit();

        return res.status(HTTPStatus.OK).json({ msg : ' sequence successfully updated' });
      } catch (e) {
        console.log(e);
       if (transaction) await transaction.rollback();
       return res.status(HTTPStatus.BAD_REQUEST).json(e);
      }
  },

  visibility: async function(req, res, model) {
    try {

      const { id } = req.params;

      const process = await model.findByPk(id);

      let status = (process.status) ? false : true;

      process.update({ status });

      return res.status(HTTPStatus.OK).json({ msg : 'successfully updated visibility'});

    } catch (e) {
      return res.status(HTTPStatus.BAD_REQUEST).json(e);

    }
  }
}


// const utils = () => {
//   const sequence = async (req, res, model) => {
//
//     var transaction;
//
//     try {
//       const { body } = req;
//
//       transaction = await sequelize.transaction();
//
//       body.forEach( async (value, index, array) => {
//
//         const portfolio = await model.update( { sequence : value.sequence }, {
//           where : {
//             id : value.id
//           }
//         }, {
//           transaction
//         });
//       })
//
//       await transaction.commit();
//
//       return res.status(HTTPStatus.OK).json({ msg : ' sequence successfully updated' });
//     } catch (e) {
//       console.log(e);
//      if (transaction) await transaction.rollback();
//      return res.status(HTTPStatus.BAD_REQUEST).json(e);
//     }
//
//   };
//
//   const visibility = async (req, res, model) => {
//     try {
//
//       const { id } = req.params;
//
//       const process = await model.findByPk(id);
//
//       let status = (process.status) ? false : true;
//
//       process.update({ status });
//
//       return res.status(HTTPStatus.OK).json({ msg : 'successfully updated visibility'});
//
//     } catch (e) {
//       return res.status(HTTPStatus.BAD_REQUEST).json(e);
//
//     }
//   };
//
//   return {
//     sequence
//   };
// };

module.exports = utils;
