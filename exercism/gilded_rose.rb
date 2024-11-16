# Problem: https://exercism.org/tracks/ruby/exercises/gilded-rose

# Solution
Item = Struct.new(:name, :sell_in, :quality) #instead of struct a class Item can be created

class GildedRose
  REVERSE_AGING_ITEMS = ["Aged Brie", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert"]

  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      update_quality(item)
      update_sell_in(item)
    end
  end

  def update_quality(item)
    is_conjured = item.name.downcase.start_with?("conjured")
    if is_conjured
      return update_conjured_item_quality(item)
    end
    
    if REVERSE_AGING_ITEMS.include?(item.name)
      return update_reverse_aging(item)
    end
    
    update_normal_item(item,false)
  end

  def update_sell_in(item)
    item.sell_in-=1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end

  def update_normal_item(item,is_conjured=false)
    sell_in_not_arrived = (item.sell_in>0)
    if sell_in_not_arrived
      item.quality-=1 if is_conjured
      item.quality = item.quality>=1 ? item.quality-1 : 0
      return item.quality
    end
    item.quality = item.quality>=2 ? item.quality-2 : 0
  end

  def update_reverse_aging(item)
    return if item.quality==50 or item.name.include?("Sulfuras, Hand of Ragnaros")
    return update_backstage_passes(item) if item.name.include?("Backstage passes to a TAFKAL80ETC concert")
    item.quality = item.sell_in>0 ? item.quality+1 : item.quality+2
    item.quality = item.quality > 50 ? 50 : item.quality
  end

  def update_backstage_passes(item,is_conjured=false)
    return item.quality=0 if item.sell_in <=0
    if item.sell_in<=5
      item.quality+=3
    elsif item.sell_in<=10
      item.quality+=2
    else
      item.quality+=1
    end
    item.quality-=1 if is_conjured
    item.quality = item.quality > 50 ? 50 : item.quality
  end
  
  def update_conjured_item_quality(item)
    return item.quality=0 if item.sell_in <=0
    if item.name.include?("backstage passes to a TAFKAL80ETC concert")
      return update_backstage_passes(item,true)
    end
    return update_reverse_aging(item) if item.name.include?("Sulfuras") or item.name.include?("Aged Brie")
    return update_normal_item(item,true)
  end
end