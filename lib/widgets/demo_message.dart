import 'package:flutter/material.dart';

/// Muestra un aviso breve (SnackBar) en los botones que, por alcance del
/// laboratorio, solo son parte del diseño y no ejecutan lógica real.
void showDemoMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
