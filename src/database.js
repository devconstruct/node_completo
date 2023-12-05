const mysql = require('mysql');

const {promisify} = require('util');
const {database} = require('./keys'); 

const pool = mysql.createPool(database);


pool.getConnection((err, connection) =>{
   
    if (err) {
      if (err.code === 'PROTOCOL_CONNECTION_LOST') {
       
      }
      if (err.code === 'ER_CON_COUNT_ERROR') {
        
      }
      if (err.code === 'ECONNREFUSED') {
        
      }
    }

    if (connection) connection.release();
      console.log('La base de datos fue conectada');
      return;
  });

  pool.query = promisify(pool.query);
  module.exports = pool;