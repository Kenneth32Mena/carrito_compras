import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import 'providers/carrito_provider.dart'; 
import 'screens/pantalla_catalogo.dart'; 
  
void main() { 
  runApp( 
    ChangeNotifierProvider( 
      create: (_) => CarritoProvider(), 
      child: const MyApp(), 
    ), 
  ); 
} 
  
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Carrito de Compras', 
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true), 
      home: const PantallaCatalogo(), 
    ); 
  } 
}