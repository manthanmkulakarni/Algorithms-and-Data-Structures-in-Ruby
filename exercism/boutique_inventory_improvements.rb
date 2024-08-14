# Problem: https://exercism.org/tracks/ruby/exercises/boutique-inventory-improvements

#Solution
require 'ostruct'
class BoutiqueInventory
  attr_reader :items
  def initialize(items)
    @items = []
    items.each do |item|
      @items.push(OpenStruct.new(item))
    end
    @items
  end

  def item_names
    items.empty? ? [] : items.map(&:name).sort
  end

  def total_stock
    stock = 0
    return stock if items.empty?
    items.each do |item|
      stock+= item.quantity_by_size.values.sum
    end
    stock
  end
end