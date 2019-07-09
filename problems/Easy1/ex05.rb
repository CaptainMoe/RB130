ENCRYPTED_PIONEERS = [
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
].freeze

def rot13(encryption)
  encryption.map do |full_name|
    full_name.split.map do |name|
      name.chars.map { |char| decipher_char(char)}.join
    end.join(" ")
  end

end

def decipher_char(char)
  case char
  when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
  when 'n'..'z', 'N'.."Z" then (char.ord - 13).chr
  end
end

puts rot13(ENCRYPTED_PIONEERS)
