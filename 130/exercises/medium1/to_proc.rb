def increase_by_one(n)
  n + 1
end

increase_proc = method(:increase_by_one).to_proc

p [8, 10, 12, 14, 16, 33].map &increase_proc
