class Code
  attr_reader(:pegs)
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.from_string(pegs_string)
    Code.new(pegs_string.split(""))
  end

  def self.valid_pegs?(array)
    array.all? {|char| POSSIBLE_PEGS.keys.include?(char.upcase)}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map {|char| char.upcase}
    else
      raise "does not contain valid pegs"
    end
  end

  def self.random(length)
    random = Array.new(length) {POSSIBLE_PEGS.keys.sample}
    Code.new(random)
  end


  def [](i)
    @pegs[i]
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(guess_code)
    counter = 0
    (0...guess_code.length).each do |i|
      if guess_code[i] == self[i]
        counter += 1
      end
    end
    return counter
    end

  def num_near_matches(guess_code)

    guess_copy = guess_code.pegs.dup
    self_copy = @pegs.dup

    (0...guess_copy.length).each do |i|
      if guess_copy[i] == self_copy[i]
        guess_copy[i] = nil
        self_copy[i] = nil
      end
    end
      guess_copy.delete(nil)
      self_copy.delete(nil)



    counter = 0
    guess_copy.each_with_index do |ele, i|
      if self_copy.include?(ele)
        counter += 1
        self_copy.delete_at(self_copy.index(ele))
      end
    end
    return counter
  end



  def == (guess_code)
    self.pegs == guess_code.pegs

  end








end

