const express = require('express');
const router = express.Router();

router.get('/', (req,res) =>{
    res.send('Mi pagina principal');
});


module.exports = router;