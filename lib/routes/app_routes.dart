/// [NUEVO] Nombres de las rutas.
///
/// Se guardan como constantes para no escribir los textos a mano en cada
/// `Navigator.pushNamed` (evita errores de tipeo).
class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String menu = '/menu';
  static const String products = '/products';
  static const String registerProduct = '/products/register';
  static const String profile = '/profile';
}
