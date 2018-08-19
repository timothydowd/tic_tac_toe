


def find_cell(choice)
  nest_array = [[123],[456],[789]]
  nest_array.map! do |row|
    row.map do |cell|
      if cell == choice
        cell = "X"
      else
        cell
      end
    end
  end
  puts nest_array
end


find_cell(7)
puts "\n"

def find_cell2(choice)
  nest_array = [[123],[456],[789]]
  nest_array.map! do |row|
    row.map do |cell|
      if cell == choice
        cell = "X"
      else
        cell
      end
    end
  end
  puts nest_array
end


find_cell2(1)
