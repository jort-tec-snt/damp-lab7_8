import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../theme/app_theme.dart';

/// Menú lateral (el icono de hamburguesa de la AppBar).
///
/// Reutiliza la misma lista `menuOptions` que usa `MenuScreen`.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // [NUEVO] Nombre de la ruta actual, para no abrir de nuevo la misma pantalla.
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.primary),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          for (final Map<String, dynamic> option in menuOptions)
            ListTile(
              leading: Icon(
                option['icon'] as IconData,
                color: option['isLogout'] == true ? Colors.red : null,
              ),
              title: Text(option['title'] as String),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer.
                final String route = option['route'] as String;
                if (option['isLogout'] == true) {
                  // [NUEVO] Borra todo el historial y vuelve al login.
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    route,
                    (_) => false,
                  );
                } else if (route != currentRoute) {
                  Navigator.pushNamed(context, route);
                }
              },
            ),
        ],
      ),
    );
  }
}
