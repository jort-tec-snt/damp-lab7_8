import 'package:flutter/material.dart';

/// Modelo (POO) de un producto.
///
/// Los datos de ejemplo viven en `app_data.dart` como `List<Map>`; el
/// constructor `fromMap` los convierte en objetos `Product`.
class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.icon,
  });

  /// [NUEVO] Constructor de fábrica: crea un `Product` a partir de un `Map`.
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      stock: map['stock'] as int,
      icon: map['icon'] as IconData,
    );
  }

  final String name;
  final String description;
  final double price;
  final int stock;
  final IconData icon;

  /// Precio con formato "S/ 3,500.00".
  String get priceLabel {
    final List<String> parts = price.toStringAsFixed(2).split('.');
    final String integer = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
    return 'S/ $integer.${parts[1]}';
  }
}
