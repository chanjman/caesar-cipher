# ceasar cipher
class CaesarCipher
  def rotate_strings(key)
    {
      origin: (('a'..'z').to_a + ('A'..'Z').to_a).join,
      cipher: (('a'..'z').to_a.rotate(key) + ('A'..'Z').to_a.rotate(key)).join
    }
  end

  def encrypt(string, key)
    string.to_s.tr(rotate_strings(key)[:origin], rotate_strings(key)[:cipher])
  end

  def decrypt(string, key)
    string.to_s.tr(rotate_strings(key)[:cipher], rotate_strings(key)[:origin])
  end
end
