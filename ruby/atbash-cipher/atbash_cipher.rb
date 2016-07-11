class Atbash
  CIPHER = ('a'..'z').zip(('a'..'z').reverse_each).to_h.freeze

  def self.encode(string)
    normalized = string.downcase.gsub(/[^a-z0-9]/, '')
    normalized.gsub(/[a-z]/, CIPHER).scan(/.{1,5}/).join(' ')
  end
end
