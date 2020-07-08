require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "it should create a new category" do
    category = Category.new(name: 'Fun')
    assert category.save
  end

end
