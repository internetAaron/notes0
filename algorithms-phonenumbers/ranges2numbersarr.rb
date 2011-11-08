def ranges2numbersarr(ranges)
  result = []
  for i in ranges.split(';')
    if i.include? "-" then 
      range = i.split('-')
      number = range[0].to_i
      until number > range[1].to_i
        result << number
        number = number + 1
      end      
    else
      result << i.to_i
    end    
  end
  result
end

input = '7676;7700-7702;7705;7707;771-772;7760-7764;7777'
output = ranges2numbersarr(input)
goal = [7676, 7700, 7701, 7702, 7705, 7707, 771, 772, 7760, 7761, 7762, 7763, 7764, 7777]

puts output == goal ? 'hurray!' : 'not yet...'