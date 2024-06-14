
def string_to_sudoku(string)
  arreglo = []

  for i in 0...string.length do
    if i % 9 == 0
      arreglo.push(string[i...i + 9].split("").map(&:to_i))
    end
  end

  arreglo
end

def imprimir_tablero(tablero)
  tablero.each do |fila|
    fila.each do |number|
      print "   "
      print number
      print "   "
    end
    puts "\n\n"
  end
end