const express = require("express");

const cors = require("cors");

const app = express();

require("dotenv").config();

const mysql = require("mysql2/promise");

app.use(cors());
app.use(express.json({ limit: "25Mb" }));

const port = process.env.SERVER_PORT || 3000;

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});

const dataConnection = {
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
};

const createConnection = async () => {
  const connection = await mysql.createConnection(dataConnection);
  await connection.connect();
  return connection;
};

app.get("/api/books", async (req, res) => {
  try {
    queryOneBook =
      "SELECT * FROM books";
    const connection = await createConnection();
    const [books] = await connection.execute(queryOneBook);
    await connection.end();
    res.json({ books: books });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
});

app.post("/api/books/new", async (req, res) => {
  try {
    const { title, publication_year, independent, id_serie } = req.body;
    const connection = await createConnection();  
    const queryNewBook =
      "INSERT INTO books (title, publication_year, independent, id_serie) VALUES (?, ?, ?, ?)";
    const [result] = await connection.execute(queryNewBook, [
      title,
      publication_year,
      independent,
      id_serie,
    ]);
    await connection.end();
    res.json({ status: "Book "+result.insertId+" created" });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
}); 

app.post("/api/books/update/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { title, publication_year, independent, id_serie } = req.body;
    const connection = await createConnection();
    const queryUpdateBook =
      "UPDATE books SET title = ?, publication_year = ?, independent = ?, id_serie = ? WHERE id = ?";
    const [result] = await connection.execute(queryUpdateBook, [
      title,
      publication_year,
      independent,
      id_serie,
      id
    ]);
    await connection.end();
    res.json({ status: "Book "+id+" updated", affectedRows: result.affectedRows });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
});

app.post("/api/books/delete/:id", async (req, res) => {
  try {
    const { id } = req.params; 
    const connection = await createConnection();
    const queryDeleteBook = "DELETE FROM books WHERE id = ?";
    const [result] = await connection.execute(queryDeleteBook, [id]);
    await connection.end();
    res.json({ status: "Book "+id+" deleted", affectedRows: result.affectedRows });
  } catch (error) {
    return res.status(500).json({ message: error.message });  
  }
});

