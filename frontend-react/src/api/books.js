const API_URL = "http://localhost:3000/api/books";

export const getBooks = async () => {
  const response = await fetch(API_URL);
  const data = await response.json();
  return data.books;
};

export const createBook = async (book) => {
  const response = await fetch(`${API_URL}/new`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(book),
  });
  return response.json();
};
