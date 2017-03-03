
M = 'land'
o = 'water'

world = [[o,o,o,o,M,M,o,o,o,o,o],
         [o,o,o,o,M,M,o,o,o,o,o],
         [o,o,o,o,o,o,o,o,M,M,o],
         [o,o,o,M,o,o,o,o,o,M,o],
         [o,o,o,M,o,M,M,o,o,o,o],
         [o,o,o,o,M,M,M,M,o,o,o],
         [o,o,o,M,M,M,M,M,M,M,M],
         [o,o,o,M,M,o,M,M,M,M,M],
         [o,o,o,o,o,o,M,M,M,o,o],
         [o,M,o,o,o,M,o,o,M,M,o],
         [o,o,o,M,o,o,o,o,M,M,o]]

def continent_size world, x, y
  # If it's not on the map, it's water, or we already counted it,
  # then we don't want to count it now.
  return 0 if world[y].nil? || world[y][x].nil? || world[y][x] != 'land'
  # So first we count this tile...
  size = 1
  world[y][x] = 'counted land'
  # ...then we count all of the neighboring eight tiles
  # (and, of course, their neighbors by way of the recursion).
  size += continent_size(world, x - 1, y - 1)
  size += continent_size(world, x,     y - 1)
  size += continent_size(world, x + 1, y - 1)
  size += continent_size(world, x - 1, y)
  size += continent_size(world, x + 1, y)
  size += continent_size(world, x - 1, y + 1)
  size += continent_size(world, x,     y + 1)
  size += continent_size(world, x + 1, y + 1)
  size
end

puts continent_size(world, 5, 5)
