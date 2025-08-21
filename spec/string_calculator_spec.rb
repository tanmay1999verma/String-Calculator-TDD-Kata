
require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calc.add("")).to eq(0)
    end

    it "returns the number for a single number" do
      expect(calc.add("1")).to eq(1)
      expect(calc.add("9")).to eq(9)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(calc.add("1,5")).to eq(6)
      expect(calc.add("2,3")).to eq(5)
    end

    it "handles any amount of comma-separated numbers" do
      expect(calc.add("1,2,3,4,5")).to eq(15)
      expect(calc.add("10,20,30")).to eq(60)
    end

    it "handles new lines between numbers in addition to commas" do
      expect(calc.add("1\n2,3")).to eq(6)
      expect(calc.add("4\n5\n6")).to eq(15)
    end

    it "supports a custom delimiter using the //<delim>\n prefix" do
      expect(calc.add("//;\n1;2")).to eq(3)
      expect(calc.add("//|\n2|3|4")).to eq(9)
    end

    it "raises with all negatives listed when negative numbers are present" do
      expect { calc.add("1,-2,3,-4") }
        .to raise_error(RuntimeError, "negative numbers not allowed -2,-4")
    end
  end
end
