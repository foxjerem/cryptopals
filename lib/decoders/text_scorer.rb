class TextScorer
  BENCHMARK = {
    a: 0.08167,
    b: 0.01492,
    c: 0.02782, 
    d: 0.04253, 
    e: 0.12702,
    f: 0.02228, 
    g: 0.02015, 
    h: 0.06094, 
    i: 0.06966, 
    j: 0.00153, 
    k: 0.00772, 
    l: 0.04025, 
    m: 0.02406, 
    n: 0.06749,  
    o: 0.07507, 
    p: 0.01929, 
    q: 0.00095, 
    r: 0.05987, 
    s: 0.06327, 
    t: 0.09056, 
    u: 0.02758, 
    v: 0.00978, 
    w: 0.02360, 
    x: 0.00150, 
    y: 0.01974, 
    z: 0.00074
  }

  def self.calculate(string)
    freq = relative_frequency(string)
    diff = BENCHMARK.map do |letter, avg|
      ( avg - (freq[letter] || 0) ) ** 2
    end
    
    Math.sqrt(diff.reduce(&:+))
  end

  def self.relative_frequency(string)
    divisor = string.length.to_f
    frequency(string).each_with_object({}) do |(letter, count), result| 
      result[letter] = count / divisor
    end
  end

  def self.frequency(string)
    string.chars.map(&:to_sym).reduce({}) do |result, char|
      if result.has_key?(char)
        (result[char] += 1) && result
      else
        result.merge({char => 1}) 
      end
    end
  end
end