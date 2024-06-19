require_relative("tablero")

puts "Que Dificultad? \n (facil,medio o dificil)"
dificultad = gets.chomp
while (dificultad != "facil" && dificultad != "medio" && dificultad != "dificil")
  puts "Caracter invalido, elegir entre facil (facil), medio (medio) o dificil (dificil) \n"
  dificultad = gets.chomp
end
case dificultad
when  "facil"
  coleccion_tableros =  File.readlines("tableros/facil.txt")
when "medio"
  coleccion_tableros =  File.readlines("tableros/medio.txt")  
when "dificil"
  coleccion_tableros =  File.readlines("tableros/dificil.txt") 
end

arreglo = Array.new

coleccion_tableros.each do |tablero|
  arreglo.push(tablero.strip)
end

random = arreglo[rand(0..arreglo.length)]
sudoku = Tablero_sudoku.new(random)
puts "el tablero a resolver es: "
imprimir_tablero(sudoku.tablero)
p sudoku.empty_positions(sudoku.tablero)


