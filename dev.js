const express = require('express');
const path = require('path')
const app = express();
const port = process.env.port || 7777;

app.use(express.static('views'));

app.get('/',(req,res)=>{
    res.sendFile(path.join(__dirname,'views','index.html'))
});

app.listen(port,()=>{
    console.log(`server listening port:${port}`);
});

