require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("brownie", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end
  
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "cat", chef) }.to raise_error(ArgumentError)
    end
  end


  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include('chocolate')
        dessert.add_ingredient('chocolate')
      expect(dessert.ingredients).to include('chocolate')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
        dessert.add_ingredient('chocolate')
        dessert.add_ingredient('sugar')
        dessert.add_ingredient('milk')
      expect(dessert.ingredients).to eq(['chocolate', 'sugar', 'milk'])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(30)
      expect(dessert.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(343242) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
  let(:chef) { Chef.new("alvin")}
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include('Alvin')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(dessert.make_more).to include(chef)
    end
  end
end
