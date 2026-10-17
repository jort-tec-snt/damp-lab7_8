import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/demo_message.dart';

/// Pantalla 5: Perfil del usuario.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          // Stack superpone widgets: el lápiz azul va sobre el avatar.
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 56,
                  backgroundColor: AppTheme.primarySoft,
                  child: Icon(Icons.person, size: 64, color: AppTheme.primary),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () => showDemoMessage(
                      context,
                      'Cambiar foto no forma parte de este laboratorio',
                    ),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: AppTheme.primary,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // [NUEVO] Lectura de valores desde un Map con userProfile['clave'].
          Center(
            child: Text(
              userProfile['nombre']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              userProfile['email']!,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 24),
          // Card con una lista de ListTile generados desde `profileRows`.
          Card(
            child: Column(
              children: [
                for (final Map<String, dynamic> row in profileRows)
                  ListTile(
                    leading: Icon(row['icon'] as IconData),
                    title: Text(row['label'] as String),
                    trailing: Text(
                      userProfile[row['key']] ?? '',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () => showDemoMessage(
                context,
                'Editar perfil no forma parte de este laboratorio',
              ),
              child: const Text('EDITAR PERFIL'),
            ),
          ),
        ],
      ),
    );
  }
}
