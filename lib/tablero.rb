
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

  def check_row(board, row, number)
    for col in 0...board[row].length
      if board[row][col] == number
        return false
      end
    end
  
    true
  end

  def check_col(board, col, number)
    for row in 0...board.length
      if board[row][col] == number
        return false
      end
    end
  
    true
  end
  
end
