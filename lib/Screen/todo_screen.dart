import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/Provider/todo_provider.dart';

class ScreenTodoList extends StatefulWidget {
  const ScreenTodoList({Key? key}) : super(key: key);

  @override
  State<ScreenTodoList> createState() => _ScreenTodoListState();
}

class _ScreenTodoListState extends State<ScreenTodoList> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    // });
    Provider.of<TodoProvider>(context, listen: false).getAllCall();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Api todo List"),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Consumer<TodoProvider>(builder: (context, value, child) {
              //*** Create Variable todos, So we can call any everywhere.
              final todos = value.todos;
              return ListView.builder(
                  //*** Now then in count call that TODOS Variable
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    //*** After that create one more variable as "TODO!" name ,then call first "TODOS@" variable with index
                    final todo = todos[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                offset: Offset(0.0, 2),
                                blurStyle: BlurStyle.normal),
                          ],
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(todo.title),
                            subtitle: Text(todo.userId.toString()),
                            trailing: Text(todo.completed.toString()),
                          ),
                        ),
                      ),
                    );
                  });
            });
          },
        ),
      ),
    );
  }
}
