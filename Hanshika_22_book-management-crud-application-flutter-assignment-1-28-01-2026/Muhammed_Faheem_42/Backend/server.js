const express = require('express');
const db = require('./db');
const employeeRouter = require('./routes/bookRouter.js');
const cors  = require('cors');

const app = express();
app.use(cors('*'));
app.use(express.json());
app.use('/books',employeeRouter);

app.get('/',()=>{
   return response.status(200).send({message:'Running'})
})


app.listen(5881,()=>{
   console.log('Server is listening on port 5881');
});
