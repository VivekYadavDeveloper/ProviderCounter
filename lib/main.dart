import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/Provider/counter_provider.dart';
import 'package:provider_counter/Provider/shopping_cart_provider.dart';
import 'package:provider_counter/Provider/todo_provider.dart';
import 'package:provider_counter/Screen/todo_screen.dart';

import 'Screen/home.dart';
import 'Screen/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterNumber>(
          create: (_) => CounterNumber(),
        ),
        ChangeNotifierProvider<ShoppingCartProvider>(
          create: (_) => ShoppingCartProvider(),
        ),
        ChangeNotifierProvider<TodoProvider>(
          create: (_) => TodoProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter/API Provider',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ScreenTodoList(),
      },
    );
  }
}
