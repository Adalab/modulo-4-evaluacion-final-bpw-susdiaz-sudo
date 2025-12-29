import { useState } from "react";
import { createBook } from "../api/books";

export default function BookForm() {
  const [form, setForm] = useState({
    title: "",
    publication_year: "",
    independent: false,
    id_serie: null,
  });

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setForm({
      ...form,
      [name]: type === "checkbox" ? checked : value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    await createBook(form);
    alert("Book added!");
  };

  return (
    <div className="card">
      <h2>Add book</h2>

      <form onSubmit={handleSubmit}>
        <input name="title" placeholder="Title" onChange={handleChange} />
        <input
          name="publication_year"
          type="number"
          placeholder="Year"
          onChange={handleChange}
        />
        <p>¿Part of Cosmere?</p>
        <input className="independent" type="checkbox" name="independent" onChange={handleChange} />

        <button type="submit">Save</button>
      </form>
    </div>
  );
}
