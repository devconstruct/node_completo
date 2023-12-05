const express = require('express');
const router = express.Router();

const pool = require('../database');


router.get('/agregar', (req, res) =>{
    res.render('datos/agregar');
});

//Insertar Datos
router.post('/agregar', async(req, res) =>{
    //Destructuring
    const {id_equipo, nombre, apellido_paterno, apellido_materno, edad,estatura, posicion} = req.body;

    //Estas constantes las voy a guardar dentro de un nuevo obejeto.
    const newDato = {
        id_equipo, 
        nombre, 
        apellido_paterno, 
        apellido_materno, 
        edad, 
        estatura, 
        posicion
    };

    await pool.query('INSERT INTO Jugadores set ?', [newDato]);
    res.redirect('/datos');
});

//Mostrar Datos
router.get('/', async(req,res) => {
    const datos = await pool.query('SELECT * FROM Jugadores');
    res.render('datos/ljugadores', {datos});
});

//Eliminar datos
router.get('/eliminar/:id_jugador', async(req,res) =>{
    //parametros de solicitud
    const {id_jugador} = req.params;
    await pool.query('DELETE FROM Jugadores WHERE id_jugador = ?', [id_jugador]);
    res.redirect('/datos');
});

//Editar datos
router.get('/editar/:id_jugador', async(req,res) =>{
    //parametros de solicitud
    const {id_jugador} = req.params;
    const jugadores = await pool.query('SELECT * FROM Jugadores WHERE id_jugador = ?', [id_jugador]);
    res.render('datos/editar', {jugadores:jugadores[0]} );
});

router.post('/editar/:id_jugador', async(req, res) =>{
    const {id_jugador} = req.params;
    //Destructuring
    const {id_equipo, nombre, apellido_paterno, apellido_materno, edad,estatura, posicion} = req.body;

    //Estas constantes las voy a guardar dentro de un nuevo obejeto.
    const newJugador = {
        id_equipo, 
        nombre, 
        apellido_paterno, 
        apellido_materno, 
        edad, 
        estatura, 
        posicion
    };

    await pool.query('UPDATE Jugadores set ? WHERE id_jugador = ?', [ newJugador,id_jugador]);
    res.redirect('/datos');
});



module.exports = router;