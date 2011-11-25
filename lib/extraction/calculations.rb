module Extraction::Calculations
  def self.degree_of_extraction(first, n)
    1.0 - (1.0 - first) ** n
  end

  def self.derivative_of_de(first, n)
    n * first * ((1.0 - first) ** (n - 1.0))
  end

end
