import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/product_form_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/profile_screen.dart';
import 'app_routes.dart';

/// [NUEVO] Tabla de rutas: relaciona cada nombre de ruta con la pantalla que abre.
///
/// Es un `Map<String, WidgetBuilder>`; `MaterialApp(routes: ...)` lo usa para
/// resolver cada llamada a `Navigator.pushNamed`.
class AppRouter {
  AppRouter._();

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.menu: (context) => const MenuScreen(),
    AppRoutes.products: (context) => const ProductListScreen(),
    AppRoutes.registerProduct: (context) => const ProductFormScreen(),
    AppRoutes.profile: (context) => const ProfileScreen(),
  };
}
