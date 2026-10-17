import 'package:damp_lab7_8/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('El login navega al menú', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Iniciar Sesión'), findsOneWidget);

    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle();

    expect(find.text('Registrar Productos'), findsOneWidget);
    expect(find.text('Listar Productos'), findsOneWidget);
  });
}
