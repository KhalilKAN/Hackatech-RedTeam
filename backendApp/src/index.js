import express from "express";
import { varConfig } from "./config/varConfig";
import * as db from "./config/connectiondb";
import morgan from "morgan";
import cors from "cors";
import router from "./routes";

const app = express();
//config port
const port = varConfig.PORT;
// DB connection
db.connecetios;
//middleware
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
//routes
app.use(router);

app.listen(port, () => {
  console.log("Server started on port " + port);
});
