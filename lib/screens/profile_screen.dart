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
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Cabecera: franja con degradado y el avatar a medias sobre ella.
          // Stack superpone widgets; Positioned fija cada uno en su sitio.
          SizedBox(
            height: 190,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 130,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: AppTheme.headerGradient,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 52,
                          backgroundColor: AppTheme.primarySoft,
                          child: Icon(
                            Icons.person,
                            size: 64,
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: GestureDetector(
                          onTap: () => showDemoMessage(
                            context,
                            'Cambiar foto no forma parte de este laboratorio',
                          ),
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: AppTheme.primary,
                            child: Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
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
          // Card con una lista de ListTile generados desde `profileRows`,
          // separados por una línea fina (Divider).
          Card(
            child: Column(
              children: [
                for (int i = 0; i < profileRows.length; i++) ...[
                  if (i > 0) const Divider(indent: 16, endIndent: 16),
                  ListTile(
                    leading: Icon(profileRows[i]['icon'] as IconData),
                    title: Text(profileRows[i]['label'] as String),
                    trailing: Text(
                      userProfile[profileRows[i]['key']] ?? '',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
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
