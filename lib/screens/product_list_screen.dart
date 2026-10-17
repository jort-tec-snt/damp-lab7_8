import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_drawer.dart';
import '../widgets/demo_message.dart';

/// Pantalla 3: Listar productos.
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  /// Convierte la lista de mapas en una lista de objetos `Product`.
  static final List<Product> _products =
      productsData.map(Product.fromMap).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Registrar producto',
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.registerProduct),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Buscador (solo diseño, no filtra).
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: AppTheme.fieldFill,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Cantidad de elementos de la lista.
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${_products.length} productos',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          // Expanded: la lista ocupa todo el espacio restante y se desplaza sola.
          Expanded(
            // [NUEVO] ListView.builder: construye solo las filas visibles,
            // ideal para listas largas.
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: _products.length,
              itemBuilder: (context, index) =>
                  _ProductTile(product: _products[index]),
            ),
          ),
        ],
      ),
    );
  }
}

/// Fila de producto: un Card que contiene un ListTile.
class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // leading: lo que aparece al inicio de la fila (imagen / icono).
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppTheme.primarySoft,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(product.icon, size: 32, color: AppTheme.primary),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // subtitle: segunda línea; aquí lleva el precio y una etiqueta de stock.
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Precio: ${product.priceLabel}'),
              const SizedBox(height: 6),
              _StockBadge(stock: product.stock),
            ],
          ),
        ),
        // trailing: lo que aparece al final (menú de tres puntos).
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              Navigator.pushNamed(context, AppRoutes.registerProduct);
            } else {
              showDemoMessage(
                context,
                'Eliminar no forma parte de este laboratorio',
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'edit', child: Text('Editar')),
            PopupMenuItem(value: 'delete', child: Text('Eliminar')),
          ],
        ),
      ),
    );
  }
}

/// Etiqueta de color según el stock (solo presentación): naranja si es bajo.
class _StockBadge extends StatelessWidget {
  const _StockBadge({required this.stock});

  final int stock;

  @override
  Widget build(BuildContext context) {
    final bool isLow = stock < 10;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: isLow ? const Color(0xFFFFF1E0) : const Color(0xFFE6F6EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Stock: $stock',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isLow ? const Color(0xFFB45309) : const Color(0xFF15803D),
        ),
      ),
    );
  }
}
