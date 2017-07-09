require 'csv'

class InvalidCodonError < ArgumentError; end

module FromCSV
  def self.read(file_path)
    translation_table = {}

    CSV.foreach(file_path) do |row|
      translation = row[0].strip
      originals   = row[1].split(',').map(&:strip)
      originals.each do |original|
        translation_table[original] = translation
      end
    end

    translation_table
  end
end

module Translation
  AMINO_ACIDS = FromCSV.read('aminoacids.csv')

  def self.of_codon(string)
    AMINO_ACIDS.fetch(string) { raise InvalidCodonError }
  end

  def self.of_rna(strand)
    proteins = []
    strand.scan(/.../).map do |codon|
      translation = of_codon(codon)
      break if translation == 'STOP'
      proteins << translation
    end
    proteins
  end
end
