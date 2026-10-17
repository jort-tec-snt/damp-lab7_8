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
    // [NUEVO] Nombre de la ruta actual, para no abrir de nuevo la misma pantalla
    // y para resaltar la opción donde ya estamos.
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Cabecera con degradado y los datos del usuario.
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(gradient: AppTheme.headerGradient),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 36, color: AppTheme.primary),
            ),
            accountName: Text(
              userProfile['nombre']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(userProfile['email']!),
          ),
          for (final Map<String, dynamic> option in menuOptions)
            _buildTile(context, option, currentRoute),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    Map<String, dynamic> option,
    String? currentRoute,
  ) {
    final String route = option['route'] as String;
    final bool isLogout = option['isLogout'] == true;

    return ListTile(
      leading: Icon(
        option['icon'] as IconData,
        color: isLogout ? Colors.red : null,
      ),
      title: Text(option['title'] as String),
      selected: route == currentRoute,
      selectedTileColor: AppTheme.primarySoft,
      onTap: () {
        Navigator.pop(context); // Cierra el Drawer.
        if (isLogout) {
          // [NUEVO] Borra todo el historial y vuelve al login.
          Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
        } else if (route != currentRoute) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
