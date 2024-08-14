# Problem : https://exercism.org/tracks/ruby/exercises/boutique-inventory

#Solution
class BoutiqueInventory
    def initialize(items)
      @items = items
    end

    def item_names
      @items.map{|item| item[:name]}.sort
    end

    def cheap
     @items.select{|item| item[:price]<30.00}  
    end

    def out_of_stock
      @items.select{|item| item[:quantity_by_size].length==0}
    end

    def stock_for_item(name)
      stock_item=@items.select{|item| item[:name]==name}[0][:quantity_by_size] 
    end

    def total_stock
      @items.map{|item| item[:quantity_by_size].map{|_,stock| stock}}.flatten.sum
    end
    
    private
    attr_reader :items
end