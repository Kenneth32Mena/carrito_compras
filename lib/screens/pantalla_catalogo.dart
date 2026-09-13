import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../models/producto.dart'; 
import '../providers/carrito_provider.dart'; 
import '../services/catalogo_service.dart'; 
import 'pantalla_carrito.dart'; 
import '../widgets/badge_carrito.dart'; 
  
class PantallaCatalogo extends StatelessWidget { 
  const PantallaCatalogo({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    final productos = CatalogoService().obtenerProductos(); 
  
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Catálogo'), 
        actions: [ 
          IconButton( 
            icon: const BadgeCarrito(), // widget del Paso 8 
            onPressed: () => Navigator.push( 
              context, 
              MaterialPageRoute(builder: (_) => const PantallaCarrito()), 
            ), 
          ), 
        ], 
      ), 
      body: ListView.builder( 
        itemCount: productos.length, 
        itemBuilder: (context, index) { 
          final producto = productos[index]; 
          return ListTile( 
            leading: Text(producto.emoji, style: const TextStyle(fontSize: 28)), 
            title: Text(producto.nombre), 
            subtitle: Text('\$${producto.precio.toStringAsFixed(2)}'), 
            trailing: ElevatedButton( 
              // context.read(): solo se ejecuta una vez, dentro de un callback 
              onPressed: () => context.read<CarritoProvider>().agregar(producto), 
              child: const Text('Agregar'), 
            ), 
          ); 
        }, 
      ), 
    ); 
  } 
} 