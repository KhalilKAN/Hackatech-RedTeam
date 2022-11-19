import { config } from "dotenv";

config();

export const varConfig = {
  PORT: process.env.PORT,
  MONGO_URI: process.env.MONGO_URI,
};
