import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurante_app/screens/auth/login_screen.dart';
import 'package:restaurante_app/screens/auth/register_screen.dart';
import 'package:restaurante_app/screens/auth/reset_password_screen.dart';
import 'screens/dashboard_screen.dart';
import 'firebase_options.dart';
import 'package:restaurante_app/screens/orders/order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante App',
      home: LoginScreen(), // Changed from OrderScreen to LoginScreen
      routes: {
        // Removed the redundant entry for '/'
        '/register': (context) => RegisterScreen(),
        '/reset-password': (context) => ResetPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
