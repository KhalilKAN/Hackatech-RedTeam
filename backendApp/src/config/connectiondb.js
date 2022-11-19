import mongoose from "mongoose";

const connections = mongoose
  .connect(
    "mongodb+srv://hackatech:root@hackaton.zeemvmk.mongodb.net/?retryWrites=true&w=majority",
    { useNewUrlParser: true, useUnifiedTopology: true }
  )
  .then((db) => console.log("Connected"))
  .catch((error) => handleError(error));

export default { connections };
