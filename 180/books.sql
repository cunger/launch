SELECT books.id, books.author,
       string_agg(categories.name, ', ') AS categories
  FROM books
       JOIN books_categories AS bc
       ON books.id = bc.book_id
       JOIN categories
       ON categories.id = bc.category_id
 GROUP BY books.id;

ALTER TABLE books_categories ADD UNIQUE(book_id, category_id);

SELECT categories.name,
       COUNT(books.id) AS book_count,
       string_agg(books.title, ', ') AS book_titles
  FROM categories
       JOIN books_categories AS bc
       ON bc.category_id = categories.id
       JOIN books
       ON bc.book_id = books.id
 GROUP BY categories.name
 ORDER BY categories.name;
