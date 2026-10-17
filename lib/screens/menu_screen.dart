import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
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
      body: Column(
        children: [
          const _GreetingCard(),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¿Qué deseas hacer?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          // Expanded: la lista ocupa el espacio que queda bajo el saludo.
          Expanded(
            // [NUEVO] ListView.builder construye cada elemento a partir de la lista
            // `menuOptions` (itemCount = cuántos, itemBuilder = cómo se dibuja cada uno).
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: menuOptions.length,
              itemBuilder: (context, index) =>
                  _MenuTile(option: menuOptions[index]),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tarjeta de bienvenida con degradado y los datos del usuario (leídos de un Map).
class _GreetingCard extends StatelessWidget {
  const _GreetingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppTheme.headerGradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bienvenido',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                Text(
                  userProfile['nombre']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userProfile['rol']!,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Fila del menú: un Card que contiene un ListTile.
class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.option});

  final Map<String, dynamic> option;

  @override
  Widget build(BuildContext context) {
    final bool isLogout = option['isLogout'] == true;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        // leading: icono dentro de un recuadro de color suave.
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isLogout ? const Color(0xFFFDECEA) : AppTheme.primarySoft,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            option['icon'] as IconData,
            color: isLogout ? Colors.red : AppTheme.primary,
          ),
        ),
        title: Text(
          option['title'] as String,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
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
  }
}
