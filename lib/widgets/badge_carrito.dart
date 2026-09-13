import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/carrito_provider.dart'; 
  
class BadgeCarrito extends StatelessWidget { 
  const BadgeCarrito({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    return Selector<CarritoProvider, int>( 
      // selector: elige QUÉ parte del estado observar 
      selector: (context, carrito) => carrito.cantidadTotal, 
      // builder: se reconstruye solo si 'cantidadTotal' cambia 
      builder: (context, cantidad, child) { 
        return Badge( 
          label: Text('$cantidad'), 
          isLabelVisible: cantidad > 0, 
          child: const Icon(Icons.shopping_cart), 
        ); 
      }, 
    ); 
  } 
} 