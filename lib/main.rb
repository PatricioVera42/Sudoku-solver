puts "Que Dificultad? \n (f,m o d)"
dificultad = gets.chomp
while (dificultad != "f" && dificultad != "m" && dificultad != "d")
  puts "Caracter invalido, elegir entre f (facil), m (medio) o d (dificil) \n"
  dificultad = gets.chomp
end
case dificultad
when  "f"
  coleccion_tableros =  File.readlines("tableros/facil.txt")
when "m"
  coleccion_tableros =  File.readlines("tableros/medio.txt")  
when "d"
  coleccion_tableros =  File.readlines("tableros/dificil.txt") 
end

arreglo = Array.new

coleccion_tableros.each do |tablero|
  arreglo.push(tablero.strip)
end

puts arreglo[rand(0..arreglo.length)]