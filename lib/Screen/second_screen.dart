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
        elevation: 10,
        title: Text(
          "Shopping Cart ${context.watch<CounterNumber>().count}",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${context.watch<ShoppingCartProvider>().count}"),
            Text("${context.watch<ShoppingCartProvider>().cart}"),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: const Text(
                  "Call The Api",
                  style: TextStyle(color: Color(0xFF000000)),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        tooltip: 'Add Item',
        backgroundColor: Colors.redAccent,
        onPressed: () =>
            context.read<ShoppingCartProvider>().addItem('T shirt'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
