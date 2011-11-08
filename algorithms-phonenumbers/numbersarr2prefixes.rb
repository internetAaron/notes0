def get_prefixes(prefix, lg)

  # actual "is number inside the range?" calculation
  # and exit out of recursion
  if lg == 0 
    return prefix.between?($first, $last) ? prefix : nil
  end

  full = true
  numbers = []

  i = 0
  # this calculation is not a part of core algorythm
  # can be uncommented for performance - to not to do a full scan
  # eg., for pair
  # 80000001987 -
  # 80000003001 to start with actual
  # 80000001987, not with 
  # 80000001000
  # i = [(($first - prefix*(10**lg)) / (10**(lg-1))), 0].max
  # if i > 0 
    # full = false
  # end

  for i in (i..9) do
    # eg.,if we got prefix '2' for thousands,
    # then next '21', '22' and so on will be checked
    # for 2100, 2200 etc
    next_prefix = prefix*10 + i

    # this IF is not a part of core algorythm
    # can be uncommented for performance - to not to do a full scan
    # eg., if range last element is
    # 80000003001 - to stop on it, and not continue till
    # 80000003999
    # if next_prefix > $last 
      # full = false
      # break
    # end

    output = get_prefixes(next_prefix, lg-1)
    
    # technical, not part of logical algorithm
    unless output.nil?  
      numbers << output 
    end
    
    # eg., for prefix '7', if all 71, 72, 73..79 are within range,
    # then get_prefixes would return same '7'
    unless output == next_prefix
      full = false
    end
  end

  # eg., for prefix '7', 
  # if all 71, 72, 73..79 are within range,
  # then return '7'; 
  # if just 77, 78, 79 are inside,
  # then [77, 78, 79] is returned
  return full ? prefix : numbers
end

def common_part_length(first, last)
  # eg., for pair
  # 80000001987 -
  # 80000003001 common part is 
  # 8000000; so length 7 is returned  
  common  = 0  
  for i in (0..first.length-1) do
    if first[i] == last[i]
      common = common + 1
    else
      break
    end
  end
  common
end

def numbersarr2prefixes(numbers)
  prefixes = []
  for pair in numbers.split(';')  

      range = pair.split('-')

      first = range.first
      last = range.last

      # length of part, which differs, is order of difference
      # which can be expressed with logarithm with base 10      
      # eg., for pair
      # 80000001987-
      # 80000003001 last 4 digits differs
      # means, order of difference is tens of thousands
      # or 10**4

      lg = first.length - common_part_length(first, last)

      # made it global, to not to pass to recursive function again and again
      $first = first.to_i
      $last = last.to_i

      scan_start = $first/ 10**lg
      scan_end = $last/ 10**lg

      for prefix in (scan_start..scan_end) do
        prefixes << get_prefixes(prefix, lg)
      end
  end
  prefixes.flatten
end

input = '74952200000-74952209999;74952210000-74952210099;74952211000-74952211019;74952211050-74952211132;74952211134-74952211154'
output = numbersarr2prefixes(input)
goal = [7495220, 749522100, 7495221100, 7495221101, 7495221105, 7495221106, 7495221107, 7495221108, 7495221109, 
7495221110, 7495221111, 7495221112, 74952211130, 74952211131, 74952211132, 74952211134, 74952211135, 
74952211136, 74952211137, 74952211138, 74952211139, 7495221114, 74952211150, 74952211151, 74952211152, 
74952211153, 74952211154]

puts output  == goal ? 'hurray!' : 'not yet...'