const path = require("path");
const express = require ("express");

const app= express();

app.use(express.static(path.join(__dirname,"./","dist")));


app.listen(5000, () => {
  console.log('Server strated on port 5000');
});



