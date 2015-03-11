module Decoder
  class DecoderResult
    INITIAL_SCORE =  1

    attr_accessor :plaintext, :score, :key
    
    def initialize
      @score = INITIAL_SCORE
    end
  end
end
