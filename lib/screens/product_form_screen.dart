import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/demo_message.dart';

/// Pantalla 4: Registrar producto (solo formulario visual, sin guardar datos).
class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Al llegar con pushNamed, la AppBar muestra sola la flecha de "atrás".
      appBar: AppBar(title: const Text('Registrar Producto')),
      // ListView con padding hace que el formulario se desplace con el teclado.
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Zona para elegir imagen (solo diseño).
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => showDemoMessage(
              context,
              'Seleccionar imagen no forma parte de este laboratorio',
            ),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: AppTheme.fieldFill,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_camera_outlined, size: 44, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Seleccionar imagen',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: 'Nombre del producto'),
          ),
          const SizedBox(height: 12),
          const TextField(
            maxLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: 'Descripción'),
          ),
          const SizedBox(height: 12),
          const TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'Precio',
              suffixIcon: Center(
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Text('S/'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Stock'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // El mensaje se muestra en la pantalla anterior, que es la que
              // queda visible al volver (el ScaffoldMessenger es global).
              showDemoMessage(context, 'Producto guardado (demostración)');
              // [NUEVO] pop() cierra esta pantalla y regresa a la anterior de la pila.
              Navigator.pop(context);
            },
            child: const Text('GUARDAR'),
          ),
        ],
      ),
    );
  }
}
