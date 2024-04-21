import { createServer } from "node:http";
import { Sequelize } from "sequelize";

const sequelize = new Sequelize(
  `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@postgres:5432/${process.env.DB_NAME}`
);
const connectToDB = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
    return true;
  } catch (error) {
    console.error("Unable to connect to the database:", error);
    return false;
  }
};
connectToDB();

const server = createServer(async (req, res) => {
  if (await connectToDB()) {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/plain");
    res.write("Successfully connected to Postgres DB via Node");
  } else {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/plain");
    res.write("Connection to Postgres DB was unsuccessful");
  }
  res.end();
}).listen(process.env.PORT);
