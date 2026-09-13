import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/carrito_provider.dart'; 
  
class PantallaCarrito extends StatelessWidget { 
  const PantallaCarrito({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Mi Carrito'), 
        actions: [ 
          IconButton( 
            icon: const Icon(Icons.delete_outline), 
            onPressed: () => context.read<CarritoProvider>().vaciar(), 
          ), 
        ], 
      ), 
      body: Consumer<CarritoProvider>( 
        builder: (context, carrito, child) { 
          if (carrito.items.isEmpty) { 
            return const Center(child: Text('El carrito está vacío')); 
          } 
          return Column( 
            children: [ 
              Expanded( 
                child: ListView.builder( 
                  itemCount: carrito.items.length, 
                  itemBuilder: (context, index) { 
                    final item = carrito.items[index]; 
                    return ListTile( 
                      leading: Text(item.producto.emoji, style: const TextStyle(fontSize: 24)), 
                      title: Text(item.producto.nombre), 
                      subtitle: Text('Cantidad: ${item.cantidad}'), 
                      trailing: Row( 
                        mainAxisSize: MainAxisSize.min, 
                        children: [ 
                          Text('\$${item.subtotal.toStringAsFixed(2)}'), 
                          IconButton( 
                            icon: const Icon(Icons.remove_circle_outline), 
                            onPressed: () => context 
                                .read<CarritoProvider>() 
                                .quitar(item.producto.id), 
                          ), 
                        ], 
                      ), 
                    ); 
                  }, 
                ), 
              ), 
              Padding( 
                padding: const EdgeInsets.all(16), 
                child: Text( 
                  'Total: \$${carrito.total.toStringAsFixed(2)}', 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                ), 
              ), 
            ], 
          ); 
        }, 
      ), 
    ); 
  } 
} 