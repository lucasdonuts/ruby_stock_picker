require 'pry'

def stock_picker(stocks)
  result = []
  profit = 0
  comp_arr = []
  # k will help to keep nil values out of our comparison array
  k = 1

  # iterate through the array, assigning the value as the stock price and the index as the day
  stocks.each_with_index do |price, day|
    i = day + 1
    diff_arr = []

    # an if statement to prevent the last day from being evaluated
    if(day == stocks.length - 1)
      next
    end

    #while loop compares each day to the rest
    while i < stocks.length
      if(price <= stocks[i]) # to prevent negative numbers
        profit = stocks[i] - price
        diff_arr[i-k] = [profit, day, i]
        i += 1
      else
        profit = 0
        diff_arr[i-k] = [profit, day, i]
        i += 1
      end
    end
    k += 1
    
    # sorting puts the highest profit sell at the end of the array
    diff_arr.sort!
    # this puts the highest profit sell for this day in a new array to be compared later
    comp_arr[day] = diff_arr.last
  end
  # again, sorting moves the most profitable sale to the end of the array
  comp_arr.sort!
  # stores the buy day and sell day of the most profitable sale into the result variable
  result = comp_arr.last.last(2)
end

p stock_picker([17,3,6,9,15,8,6,1,10])