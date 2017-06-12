
module ROT
  CHARS = ('A'..'Z').to_a + ('a'..'z').to_a

  def self.rotate(str, by = 13)
    str.chars.map { |char| ROT::move(char, by) }.join
  end

  private

  def self.move(char, n)
    index = CHARS.find_index char
    if index.nil?
      char
    else
      new_index  = index + n
      new_index -= new_index >= CHARS.size ? CHARS.size : 0
      CHARS[new_index]
    end
  end
end

names = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

names.each { |name| puts ROT::rotate name }
