import 'package:flutter/material.dart';
import '../screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'dash';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'add_user': (BuildContext context) => const RegisterScreen(),
    'cart': (BuildContext context) => const CartScreen(),
    'dash': (BuildContext context) => const DashboardScreen(),
    'cat': (BuildContext context) => const ListCategoryScreen(),
    'prov': (BuildContext context) => const ProviderScreen(),
    'edit_cat': (BuildContext context) => const EditCategoryScreen(),
    'edit_prov': (BuildContext context) => const EditProviderScreeen(),
    
    //'error': (BuildContext context) => const ErrorScreen(),
    //'prueba': (BuildContext context) => const Prueba(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
