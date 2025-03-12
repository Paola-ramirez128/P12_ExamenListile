import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Clase Producto
class Producto {
  final int id;
  final double precio;
  final String diseno;

  Producto(this.id, this.precio, this.diseno);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(" LisTile Amanda Ramirez 1284"),
          titleTextStyle:
              const TextStyle(color: Color(0xff000000), fontSize: 17),
          centerTitle: true,
          backgroundColor: const Color(0xffe89595),
        ),
        body: ListaProductos(),
      ),
    );
  }
}

class ListaProductos extends StatelessWidget {
  // Lista de mapas con datos de productos (artesanías)
  final List<Map<String, dynamic>> productosData = [
    {'id': 1, 'precio': 19.99, 'diseño': 'Cerámica'},
    {'id': 2, 'precio': 29.99, 'diseño': 'Tejido'},
    {'id': 3, 'precio': 39.99, 'diseño': 'Joyería'},
    {'id': 4, 'precio': 49.99, 'diseño': 'Pintura'},
    {'id': 5, 'precio': 59.99, 'diseño': 'Escultura'},
  ];

  // Función para obtener un icono según el diseño del producto (artesanía)
  IconData obtenerIcono(String diseno) {
    switch (diseno.toLowerCase()) {
      case 'cerámica':
        return Icons.brush; // Icono para cerámica
      case 'tejido':
        return Icons.workspaces; // Icono para tejido
      case 'joyería':
        return Icons.workspaces_outlined; // Icono para joyería
      case 'pintura':
        return Icons.palette; // Icono para pintura
      case 'escultura':
        return Icons.handyman; // Icono para escultura
      default:
        return Icons.shopping_cart; // Icono por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: productosData.map((productoData) {
          // Crear una instancia de Producto a partir del mapa
          final producto = Producto(
            productoData['id'],
            productoData['precio'],
            productoData['diseño'],
          );

          return Column(
            children: [
              // Contenedor con sombra y color dinámico (más pequeño)
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 12.0), // Reducir el margen
                decoration: BoxDecoration(
                  color: Colors.primaries[producto.id % Colors.primaries.length]
                      .shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    obtenerIcono(producto.diseno), // Icono según el diseño
                    color: Colors
                        .primaries[producto.id % Colors.primaries.length]
                        .shade900,
                  ),
                  title: Text('ID: ${producto.id}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Precio: \$${producto.precio.toStringAsFixed(2)}"),
                      Text("Diseño: ${producto.diseno}"),
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0), // Reducir el padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              // Separador entre elementos (excepto el último)
              if (producto.id != productosData.length)
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.0,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
