# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    # Custom delimiter header: //<delim>\n<payload>
    delimiter_regex, payload = if numbers.start_with?("//")
      header, payload = numbers.split("\n", 2)
      delimiter = Regexp.escape(header[2..]) # part after //
      [Regexp.union(/#{delimiter}/, /\n/), payload.to_s]
    else
      [Regexp.union(/,/, /\n/), numbers]
    end

    # If it's a single number (no delimiter present)
    return payload.to_i if payload !~ delimiter_regex

    parts = payload.split(delimiter_regex)
    nums = parts.reject(&:empty?).map(&:to_i)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    nums.sum
  end
end
