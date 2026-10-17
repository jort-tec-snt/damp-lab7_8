import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../routes/app_routes.dart';
import '../widgets/app_drawer.dart';

/// Pantalla 2: Menú principal.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú')),
      // Al declarar un drawer, la AppBar muestra sola el icono de hamburguesa.
      drawer: const AppDrawer(),
      // [NUEVO] ListView.builder construye cada elemento a partir de la lista
      // `menuOptions` (itemCount = cuántos, itemBuilder = cómo se dibuja cada uno).
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: menuOptions.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> option = menuOptions[index];
          final bool isLogout = option['isLogout'] == true;

          // [NUEVO] Card (tarjeta) + ListTile (fila con icono, texto y flecha).
          return Card(
            child: ListTile(
              leading: Icon(
                option['icon'] as IconData,
                color: isLogout ? Colors.red : null,
              ),
              title: Text(option['title'] as String),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                if (isLogout) {
                  // Quita todas las pantallas del historial y abre el login.
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (_) => false,
                  );
                } else {
                  // Apila la nueva pantalla encima del menú.
                  Navigator.pushNamed(context, option['route'] as String);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
