import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/Provider/counter_provider.dart';
import 'package:provider_counter/Provider/shopping_cart_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Cart ${context.watch<CounterNumber>().count}",
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${context.watch<ShoppingCartProvider>().count}"),
            Text("${context.watch<ShoppingCartProvider>().cart}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        key: const Key('addItem_floatingActionButton'),
        tooltip: 'Add Item',
        onPressed: () =>
            context.read<ShoppingCartProvider>().addItem('T shirt'),
      ),
    );
  }
}
