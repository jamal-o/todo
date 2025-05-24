import 'package:flutter/material.dart';
import 'package:todo/src/feat/auth/presentation/sign_in_page.dart';
import 'package:todo/src/feat/cart/presentation/product_page.dart';
import 'package:todo/src/feat/main_page/presentation/list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductPage(),
    );
  }
}
