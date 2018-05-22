class CaesarCipher
  attr_reader :text_input, :factor

  def initialize(text_input, factor = 13)
    @text_input = text_input
    @factor = factor
  end

  def perform
    alphabet_downcase = ('a'..'z').to_a
    alphabet_upcase = ('A'..'Z').to_a

    downcase_hash_rotated = Hash[alphabet_downcase.zip(alphabet_downcase.rotate(factor))]
    upcase_hash_rotated = Hash[alphabet_upcase.zip(alphabet_upcase.rotate(factor))]

    merged_hash_encrypted = downcase_hash_rotated.merge(upcase_hash_rotated)
    encrypted_arr = text_input.chars.map do |char|
      merged_hash_encrypted.fetch(char, char)
    end
    encrypted_arr.join
  end
end
