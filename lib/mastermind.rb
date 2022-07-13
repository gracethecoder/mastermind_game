require_relative "code"

class Mastermind
  def initialize (length)
    @secret_code = Code.random(length)
  end

  def print_matches(guess_code)
    puts "exeact matches" + " " +@secret_code.num_exact_matches(guess_code).to_s
    puts "near matches" + " " + @secret_code.num_near_matches(guess_code).to_s
  end

  def ask_user_for_guess
    puts "Enter a code"
    code = Code.from_string(gets.chomp)
      print_matches(code)
      return @secret_code == code


  end


end
