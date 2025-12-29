import BookSearch from "./components/bookSearch";
import BookForm from "./components/bookForm";
import "./styles/App.scss";

export default function App() {
  return (
    <div className="container">
      <h1>📖 Sanderson Library</h1>
      <BookSearch />
      <BookForm />
    </div>
  );
}
