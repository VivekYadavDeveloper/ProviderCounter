import 'package:flutter/cupertino.dart';
import 'package:provider_counter/Services/todo_services.dart';

import '../Model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final ApiServices _service = ApiServices();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllCall() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
