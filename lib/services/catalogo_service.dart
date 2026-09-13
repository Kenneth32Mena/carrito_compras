import '../models/producto.dart'; 
  
class CatalogoService { 
  // En un caso real, aquí iría una llamada HTTP  
  List<Producto> obtenerProductos() { 
    return const [ 
      Producto(id: '1', nombre: 'Camisa', precio: 25.0, emoji: '👕'), 
      Producto(id: '2', nombre: 'Pantalón', precio: 40.0, emoji: '👖'), 
      Producto(id: '3', nombre: 'Zapatos', precio: 60.0, emoji: '👟'), 
      Producto(id: '4', nombre: 'Gorra', precio: 15.0, emoji: '🧢'), 
    ]; 
  } 
} 