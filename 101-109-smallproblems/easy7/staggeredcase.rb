
def staggered_case1(str)
  staggered_str = ''
  str.each_char.with_index do |char, index|
    staggered_str << char.upcase   if index.even?
    staggered_str << char.downcase if index.odd?
  end
  staggered_str
end

def staggered_case2(str, non_alphabetics_count = true)
  staggered_str = ''
  upcase = true
  str.each_char do |char|
    if char =~ /[[:alpha:]]/
      if upcase
        staggered_str << char.upcase
      else
        staggered_str << char.downcase
      end
      upcase = !upcase
    else
      staggered_str << char
      upcase = !upcase if non_alphabetics_count
    end
  end
  staggered_str
end

## Tests

p staggered_case1('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case1('ALL_CAPS') == 'AlL_CaPs'
p staggered_case1('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS', false) == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'
