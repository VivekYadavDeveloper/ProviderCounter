import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/Provider/counter_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () => context.read<CounterNumber>().increment(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: const Text("Counter/API Provider"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You Have Pushed The Button This Many Time: ${context.watch<CounterNumber>().count}",
              ),
              const Count(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text(
                  "Next Screen",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<CounterNumber>().count}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
