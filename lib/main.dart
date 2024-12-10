import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/authentication/login_screen.dart';
import 'package:flutter_application_1/users/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      debugShowCheckedModeBanner: false, // Sửa lỗi dấu chấm phẩy
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 237, 242, 208),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Đặt màn hình chính là LoginScreen
    );
  }
}
