
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

class Tablero_sudoku
  
  attr_accessor :tablero
  
  def initialize(tablero)
    @tablero = string_to_sudoku(tablero)
  end

  def empty_positions(tablero)
    empty_positions = []
    for row in 0...tablero.length
      for col in 0...tablero.length
        if tablero[row][col] == 0
          empty_positions << [row,col]
        end
      end
    end

    empty_positions
  end

  def check_row(tablero, row, number)
    for col in 0...tablero[row].length
      if tablero[row][col] == number
        return false
      end
    end
  
    true
  end

  def check_col(tablero, col, number)
    for row in 0...tablero.length
      if tablero[row][col] == number
        return false
      end
    end
  
    true
  end

  def check_block(tablero, row, col, number)
    lower_row = 3 * (row / 3)
    lower_col = 3 * (col / 3)
    upper_row = lower_row + 3
    upper_col = lower_col + 3
  
    for r in lower_row...upper_row
      for c in lower_col...upper_col
        if tablero[r][c] == number
          return false
        end
      end
    end
  
    true
  end

  def check_value(tablero, row, col, number)
    check_row(tablero, row, number) &&
      check_col(tablero, col, number) &&
      check_block(tablero, row, col, number)
  end
  
end
