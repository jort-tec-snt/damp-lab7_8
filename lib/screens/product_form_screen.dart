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
            borderRadius: BorderRadius.circular(14),
            onTap: () => showDemoMessage(
              context,
              'Seleccionar imagen no forma parte de este laboratorio',
            ),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppTheme.fieldFill,
                borderRadius: BorderRadius.circular(14),
                border: const Border.fromBorderSide(
                  BorderSide(color: Color(0xFFD0D5DD)),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: 30,
                      color: AppTheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Seleccionar imagen',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Datos del producto',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Nombre del producto',
              prefixIcon: Icon(Icons.inventory_2_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            maxLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Descripción',
              prefixIcon: Icon(Icons.notes_outlined),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'Precio',
              prefixIcon: Icon(Icons.payments_outlined),
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
            decoration: InputDecoration(
              hintText: 'Stock',
              prefixIcon: Icon(Icons.numbers),
            ),
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
