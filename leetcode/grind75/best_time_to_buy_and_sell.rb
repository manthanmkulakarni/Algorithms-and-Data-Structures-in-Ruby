=begin
You are given an array prices where prices[i] is the price of a given stock on the ith day.
You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
=end

#Solution
def max_profit(prices)
    min_left = Float::INFINITY
    max_profit = 0
    prices.each do |price|
        min_left = min_left > price ? price : min_left
        curr_profit = price-min_left
        max_profit = curr_profit>max_profit ? curr_profit : max_profit
    end
    max_profit
end