const express = require("express"); // importing express
const mongoose = require("mongoose");
const adminRoute = require("./routes/admin");
const authRoute = require("./routes/auth");
const DB =
  "mongodb+srv://kartik:kartik123@cluster0.ubloqf3.mongodb.net/?retryWrites=true&w=majority";

const PORT = 2000;
const app = express();

app.use(express.json());
app.use(authRoute);
app.use(adminRoute);

mongoose
  .connect(DB)
  .then(() => console.log("succesfully conntected to mongo DB"))
  .catch((e) => console.log(`conntect failed to mongo DB because ${e}`));

app.listen(PORT, "0.0.0.0", () => console.log(`connected at port ${PORT}`));
