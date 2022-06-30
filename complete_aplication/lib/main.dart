import 'package:complete_aplication/pages/home.dart';
import 'package:complete_aplication/pages/login.dart';
import 'package:complete_aplication/pages/register.dart';
import 'package:complete_aplication/pages/welcome.dart';
import 'package:complete_aplication/providers/app_providers.dart';
import 'package:complete_aplication/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.WELCOME: (_) => WelcomePage(),
          AppRoutes.LOGIN: (_) => LoginPage(),

          AppRoutes.HOME: (_) => HomePage(),
          AppRoutes.REGISTER: (_) => RegisterPage(),
        },
      ),
    );
  }
}
