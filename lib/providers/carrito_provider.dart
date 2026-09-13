import 'package:flutter/foundation.dart'; 
import '../models/producto.dart'; 
import '../models/item_carrito.dart'; 
  
class CarritoProvider extends ChangeNotifier { 
  final List<ItemCarrito> _items = []; 
  
  List<ItemCarrito> get items => List.unmodifiable(_items); 
  
  int get cantidadTotal => 
      _items.fold(0, (suma, item) => suma + item.cantidad); 
  
  double get total => 
      _items.fold(0.0, (suma, item) => suma + item.subtotal); 
  
  void agregar(Producto producto) { 
    final indice = _items.indexWhere((i) => i.producto.id == producto.id); 
    if (indice >= 0) { 
      _items[indice].cantidad++; 
    } else { 
      _items.add(ItemCarrito(producto: producto)); 
    } 
    notifyListeners(); // avisa a todos los widgets que escuchan 
  } 
  
  void quitar(String productoId) { 
    final indice = _items.indexWhere((i) => i.producto.id == productoId); 
    if (indice < 0) return; 
  
    if (_items[indice].cantidad > 1) { 
      _items[indice].cantidad--; 
    } else { 
      _items.removeAt(indice); 
    } 
    notifyListeners(); 
  } 
  
  void vaciar() { 
    _items.clear(); 
    notifyListeners(); 
  } 
} 
 