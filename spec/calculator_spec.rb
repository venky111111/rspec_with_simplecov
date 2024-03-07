  
require 'rails_helper'

require './lib/calculator_module'
RSpec.describe CalculatorModule::Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = CalculatorModule::Calculator.new
      result = calculator.add(2, 3)
      expect(result).to eq(5)
    end
  end

  describe "#subtract" do
    it "returns the difference of two numbers" do
      calculator = CalculatorModule::Calculator.new
      result = calculator.subtract(5, 3)
      expect(result).to eq(2)
    end
  end
end
