const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

const app = express();


app.set('port', process.env.PORT || 3000);


app.set('views', path.join(__dirname, 'views')); //decirle a node que la 

app.engine('.hbs', exphbs.engine({

    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars.js')
}));

app.set('view engine', '.hbs');



app.use(morgan('dev'));

app.use(express.urlencoded({ extended: false }));
app.use(express.json());


//Rutas
app.use(require('./routes/index.js'));
app.use('/datos', require('./routes/datos.js'));



app.use(express.static(path.join(__dirname, 'public')));




app.listen(app.get('port'), () => {
    console.log('Servidor corriendo desde el puerto', app.get('port'));
});