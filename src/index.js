const express = require("express");

const cors = require("cors");

const app = express();

require("dotenv").config();

const mysql = require("mysql2/promise");

app.use(cors());
app.use(express.json({ limit: "25Mb" }));

const port = process.env.PORT || 3000;

const dataConnection = {
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DB,
};