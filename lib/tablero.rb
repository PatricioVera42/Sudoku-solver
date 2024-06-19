
def string_to_sudoku(string)
  arreglo = []

  for i in 0...string.length do
    if i % 9 == 0
      arreglo.push(string[i...i + 9].split("").map(&:to_i))
    end
  end

  arreglo
end

class Tablero_sudoku
  
  attr_accessor :tablero
  
  def initialize(tablero)
    @tablero = string_to_sudoku(tablero)
  end

  def imprimir_tablero
    puts "el tablero: "
    @tablero.each do |fila|
      fila.each do |number|
        print "   "
        print number
        print "   "
      end
      puts "\n\n"
    end
  end  

  def posiciones_vacias(tablero)
    posiciones_vacias = []
    for fila in 0...tablero.length
      for col in 0...tablero.length
        if tablero[fila][col] == 0
          posiciones_vacias << [fila,col]
        end
      end
    end

    posiciones_vacias
  end

  def check_fila(tablero, fila, num)
    for col in 0...tablero[fila].length
      if tablero[fila][col] == num
        return false
      end
    end
  
    true
  end

  def check_col(tablero, col, num)
    for fila in 0...tablero.length
      if tablero[fila][col] == num
        return false
      end
    end
  
    true
  end

  def check_bloque(tablero, fila, col, num)
    primer_fila = 3 * (fila / 3)
    primer_col = 3 * (col / 3)
    ultima_fila = primer_fila + 3
    ultima_col = primer_col + 3
  
    for f in primer_fila...ultima_fila
      for c in primer_col...ultima_col
        if tablero[f][c] == num
          return false
        end
      end
    end
  
    true
  end

  def check_valor(tablero, fila, col, num)
    check_fila(tablero, fila, num) &&
      check_col(tablero, col, num) &&
      check_bloque(tablero, fila, col, num)
  end
  
  def solve_puzzle(tablero, posiciones_vacias)
    i = 0
    
    while i < posiciones_vacias.length
      fila = posiciones_vacias[i][0]
      columna = posiciones_vacias[i][1]
      num = tablero[fila][columna] + 1
      encontrado = false
  
      while !encontrado && num <= 9
        if check_valor(tablero, fila, columna, num)
          encontrado = true
          tablero[fila][columna] = num
          i += 1
        else
          num += 1
        end
      end
  
      if !encontrado
        tablero[fila][columna] = 0
        i -= 1
      end
    end
    
    tablero
  end

end
