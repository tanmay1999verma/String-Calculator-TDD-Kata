# class String Claculator to perform Sting related actions like add numbers etc
class StringCalculator
  def add(numbers)

    # returns if there is no input value
    return 0 if numbers.nil? || numbers.empty?

    # set delimiter_regex and number_stringand 
    delimiter_regex, number_string = build_delimited_string(numbers)
  

    # Return if single number
    return number_string.to_i if number_string !~ delimiter_regex

    # Get an array of numbers to be added
    nums = number_string.split(delimiter_regex).map(&:to_i)

    # raise an error in nagative values are present
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end

  private
  
  def build_delimited_string(numbers)
    if numbers.start_with?("//")
      delimiter_string, rest = numbers.split("\n", 2)
      delimiter = Regexp.escape(delimiter_string[2..]) # part after //
      [Regexp.union(/#{delimiter}/, /\n/), rest.to_s]
    else
      [Regexp.union(/,/, /\n/), numbers]
    end
  end
end
