class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    limit = [strand.length, other_strand.length].min
    (0...limit).count { |index| strand[index] != other_strand[index] }
  end
end
