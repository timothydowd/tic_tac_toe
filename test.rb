
nest_array = [[123],[456],[789]]

def find_cell(choice)
  nest_array.map do |row|
    row.map do |cell|
      if cell == choice
        cell = "X"
      end
    end
  end
end


find_cell(7)

puts nest_array
