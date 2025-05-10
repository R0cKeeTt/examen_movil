import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/category_form_provider.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/services/product_service.dart';
import 'package:flutter_application_1/services/provider_service.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'theme/theme.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServices(),lazy: false),
        ChangeNotifierProvider(create: (_) => ProductService(),lazy: false),
        ChangeNotifierProvider(create: (_) => CategoryService(),lazy: false),
        ChangeNotifierProvider(create: (_) => CartProvider(),lazy: false),
        ChangeNotifierProvider(create: (_) => ProviderService(),lazy: false,),
        ChangeNotifierProvider(create: (_) => CategoryFormProvider(),lazy: false,),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: MyTheme.myTheme,
    );
  }
}
