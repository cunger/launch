CREATE TABLE expenses (
  id         serial         PRIMARY KEY,
  amount     numeric(13, 2) NOT NULL CHECK (amount > 0.00),
  created_on date           NOT NULL DEFAULT now(),
  memo       text
);
