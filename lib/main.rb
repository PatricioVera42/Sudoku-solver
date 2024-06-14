

tablero_faciles = File.readlines('tableros/facil.txt');
arreglo = Array.new

tablero_faciles.each do |tablero|
  arreglo.push(tablero.strip)
end

putsclear
 arreglo[0..5]
