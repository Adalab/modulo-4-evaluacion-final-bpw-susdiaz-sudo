import { useState, useEffect } from "react";
import { getBooks } from "../api/books";

export default function BookSearch() {
  const [books, setBooks] = useState([]);
  const [search, setSearch] = useState("");
  const [year, setYear] = useState("");

  useEffect(() => {
    getBooks().then(setBooks);
  }, []);

  const filteredBooks = books.filter(book =>
    book.title.toLowerCase().includes(search.toLowerCase()) &&
    (year === "" || book.publication_year == year)
  );

  return (
    <div className="card">
      <h2>Search books</h2>

      <input
        placeholder="Title"
        value={search}
        onChange={e => setSearch(e.target.value)}
      />

      <input
        placeholder="Year"
        type="number"
        value={year}
        onChange={e => setYear(e.target.value)}
      />

      <ul className="bookList">
        {filteredBooks.map(book => (
          <li key={book.id}>
            <strong>{book.title}</strong> ({book.publication_year})
          </li>
        ))}
      </ul>
    </div>
  );
}
