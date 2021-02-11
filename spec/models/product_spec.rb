require 'rails_helper'

RSpec.describe Product, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # validation tests/examples here
    it 'saves successfully when has name, price, quantity, category set' do
      @category = Category.new(name: "Sports")
      @category.save!
      @product = Product.new(name: "basketball shoes", price: "1000", quantity: "4", category_id: @category.id)
      @product.save!
      expect(@product.id).to be_present

    end

    it 'validates name is present when product created' do
      @category = Category.new(name: "Soccer")
      @category.save!
      @product = Product.new(name: "soccer shoes", price: "2000", quantity: "5", category_id: @category.id)
      @product.save!
      expect(@product.name).to be_present

      @product2 = Product.create(price: "2000", quantity: "5", category_id: @category.id)
      expect(@product2.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates quantity is present when product created' do
      @category = Category.new(name: "Soccer")
      @category.save!
      @product = Product.new(name: "soccer shoes", price: "2000", quantity: "5", category_id: @category.id)
      @product.save!
      expect(@product.quantity).to be_present

      @product2 = Product.create(price: "2000", name: "Book", category_id: @category.id)
      expect(@product2.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates price is present when product created' do
      @category = Category.new(name: "Soccer")
      @category.save!
      @product = Product.new(name: "soccer shoes", price: "2000", quantity: "5", category_id: @category.id)
      @product.save!
      expect(@product.price).to be_present

      @product2 = Product.create(name: "Carpet", quantity: "5", category_id: @category.id)
      expect(@product2.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates category is present when product created' do
      @category = Category.new(name: "Soccer")
      @category.save!
      @product = Product.new(name: "soccer shoes", price: "2000", quantity: "5", category_id: @category.id)
      @product.save!
      expect(@product.category_id).to be_present

      @product2 = Product.create(name: "Food Container", price: "2000", quantity: "5")
      expect(@product2.errors.full_messages).to include("Category can't be blank")
    end
  end
end

=begin
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :quantity, presence: true
=end

=begin
describe '#id' do
  it 'should not exist for new records' do
    @widget = Widget.new
    expect(@widget.id).to be_nil
  end

  it 'should be auto-assigned by AR for saved records' do
    @widget = Widget.new
    # we use bang here b/c we want our spec to fail if save fails (due to validations)
    # we are not testing for successful save so we have to assume it will be successful
    @widget.save!

    expect(@widget.id).to be_present
  end
end
=end

=begin
create_table "categories", force: :cascade do |t|
  t.string   "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end


create_table "products", force: :cascade do |t|
  t.string   "name"
  t.text     "description"
  t.string   "image"
  t.integer  "price_cents"
  t.integer  "quantity"
  t.datetime "created_at",  null: false
  t.datetime "updated_at",  null: false
  t.integer  "category_id"
end

=end