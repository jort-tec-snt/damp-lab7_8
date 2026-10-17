import 'package:flutter/material.dart';

/// [NUEVO] Tema global de la aplicación.
///
/// Se define UNA sola vez con `ThemeData` y se entrega a `MaterialApp(theme: ...)`.
/// Así AppBar, botones, campos de texto, Card y ListTile se ven iguales en todas
/// las pantallas sin repetir estilos en cada widget.
class AppTheme {
  AppTheme._(); // Constructor privado: esta clase solo agrupa constantes y estilos.

  static const Color primary = Color(0xFF1A73E8);
  static const Color primarySoft = Color(0xFFE8F0FE);
  static const Color fieldFill = Color(0xFFF1F3F6);

  static ThemeData get light {
    // `fromSeed` genera una paleta completa a partir de un color base.
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.white,

      // Barra superior azul con texto e iconos blancos.
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Estilo común de todas las tarjetas (Card).
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 1.5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      // Los iconos de los ListTile toman el color primario.
      listTileTheme: const ListTileThemeData(iconColor: primary),

      // Botón principal: ancho completo y esquinas redondeadas.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Botón secundario con borde azul.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size.fromHeight(48),
          side: const BorderSide(color: primary),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Campos de texto con borde redondeado; el enfocado se resalta en azul.
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
      ),
    );
  }
}
