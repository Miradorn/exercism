# Transform legacy data to new Format.
class ETL
  class << self
    def transform(old)
      old.map do |score, letters|
        letters.map { |l| { l.downcase => score } }
      end.flatten.reduce(&:merge)
    end
  end
end
