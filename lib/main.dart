import 'package:flutter/material.dart';
import 'package:flutter_restfullapi/view/login_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/home_page.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginView(),
    );
  }
}
