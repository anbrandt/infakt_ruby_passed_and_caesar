class PassedOrFailed
  attr_reader :results, :threshold

  def initialize(results, threshold)
    @results = results
    @threshold = if threshold.class == Integer
                   threshold
                 else
                   threshold.to_i
                 end
  end

  def perform
    passed = Hash.new
    failed = Hash.new
    @results.each do |key, value|
      value_int = value.to_i
      (value_int >= threshold) ? (passed[key] = value_int) : failed[key] = value_int
      end
    expected_hash = Hash.new
    expected_hash[:passed] = passed
    expected_hash[:failed] = failed
    expected_hash
  end
end

hash = { 'Mark' => '10', 'Ellen' => 65, 'Roger' => '20', 'Mike' => 70, 'Dan' => 99, 'Witt' => 10 }

puts PassedOrFailed.new(hash, '55').perform
