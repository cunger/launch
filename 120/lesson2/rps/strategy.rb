module Strategy
  class Random
    def self.compute_from(options, _)
      options.sample
    end
  end
end
