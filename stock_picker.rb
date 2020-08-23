require 'pry'

def stock_picker(stocks)
  result = []
  profit = 0
  comp_arr = []
  k = 1

  stocks.each_with_index do |day, idx|
    buy_day = idx
    i = idx + 1
    diff_arr = []

    if(idx == stocks.length - 1)
      next
    end
    #while loop compares each day to the rest
    while i < stocks.length
      if(day <= stocks[i])
        difference = stocks[i] - day
        diff_arr[i-k] = [difference, buy_day, i]
        i += 1
      else
        difference = 0
        diff_arr[i-k] = [difference, buy_day, i]
        i += 1
      end
    end
    k += 1
    
    diff_arr.sort!
    comp_arr[idx] = diff_arr.last
  end
  comp_arr.sort!
  result = comp_arr.last.last(2)
end

p stock_picker([17,3,6,9,15,8,6,1,10])