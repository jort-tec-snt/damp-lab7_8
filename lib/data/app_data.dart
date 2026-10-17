import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

// [NUEVO] LISTAS Y MAPAS
//
// - `List<Map<String, dynamic>>`: lista donde cada elemento es un mapa
//   (clave -> valor). Es el formato típico de datos que luego vendrían de una API.
// - `Map<String, String>`: pares clave -> valor para un único registro.
//
// Al ser `const`, Dart crea estos datos una sola vez en tiempo de compilación.

/// Opciones del menú principal y del Drawer.
const List<Map<String, dynamic>> menuOptions = [
  {
    'title': 'Registrar Productos',
    'icon': Icons.shopping_cart,
    'route': AppRoutes.registerProduct,
  },
  {
    'title': 'Listar Productos',
    'icon': Icons.list_alt,
    'route': AppRoutes.products,
  },
  {
    'title': 'Perfil',
    'icon': Icons.person,
    'route': AppRoutes.profile,
  },
  {
    'title': 'Logout',
    'icon': Icons.logout,
    'route': AppRoutes.login,
    'isLogout': true,
  },
];

/// Productos de ejemplo (solo para mostrar el diseño).
const List<Map<String, dynamic>> productsData = [
  {
    'name': 'Laptop',
    'description': 'Laptop para oficina y estudio',
    'price': 3500.0,
    'stock': 10,
    'icon': Icons.laptop_mac,
  },
  {
    'name': 'Mouse',
    'description': 'Mouse inalámbrico',
    'price': 50.0,
    'stock': 25,
    'icon': Icons.mouse,
  },
  {
    'name': 'Teclado',
    'description': 'Teclado mecánico',
    'price': 120.0,
    'stock': 15,
    'icon': Icons.keyboard,
  },
  {
    'name': 'Monitor',
    'description': 'Monitor Full HD de 24 pulgadas',
    'price': 800.0,
    'stock': 8,
    'icon': Icons.desktop_windows,
  },
  {
    'name': 'Impresora',
    'description': 'Impresora multifuncional',
    'price': 450.0,
    'stock': 5,
    'icon': Icons.print,
  },
  {
    'name': 'Auriculares',
    'description': 'Auriculares con micrófono',
    'price': 90.0,
    'stock': 30,
    'icon': Icons.headphones,
  },
];

/// Datos del usuario: un Map clave -> valor.
const Map<String, String> userProfile = {
  'nombre': 'Juan Pérez',
  'email': 'juan.perez@correo.com',
  'telefono': '987654321',
  'rol': 'Administrador',
};

/// Filas que se muestran en el perfil. `key` indica qué valor leer de `userProfile`.
const List<Map<String, dynamic>> profileRows = [
  {'icon': Icons.person, 'label': 'Nombre', 'key': 'nombre'},
  {'icon': Icons.email, 'label': 'Email', 'key': 'email'},
  {'icon': Icons.phone, 'label': 'Teléfono', 'key': 'telefono'},
  {'icon': Icons.settings, 'label': 'Roles', 'key': 'rol'},
];
