
# 8-4-4-4-12

HEX = ('0'..'9').to_a + ('a'..'f').to_a

def uuid
  uuid = ''
  [8, 4, 4, 4, 12].each do |block|
    block.times { uuid << HEX.sample }
    uuid << '-'
  end
  uuid[0..-2]
end

p uuid
