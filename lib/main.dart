import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// Widget raíz de la aplicación.
///
/// MaterialApp concentra tres cosas del laboratorio:
///  - `theme`: el tema global (ver `AppTheme`).
///  - `initialRoute`: la primera pantalla que se muestra.
///  - `routes`: la tabla de rutas con nombre (ver `AppRouter`).
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7 y 8 - Productos',
      debugShowCheckedModeBanner: false,
      // [NUEVO] Tema global: todas las pantallas lo heredan automáticamente.
      theme: AppTheme.light,
      // [NUEVO] Rutas con nombre: se navega con Navigator.pushNamed(context, '/ruta').
      initialRoute: AppRoutes.login,
      routes: AppRouter.routes,
    );
  }
}
