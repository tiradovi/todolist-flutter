import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider with ChangeNotifier {
  final TodoService _todoService = TodoService();
  List<TodoModel> _todos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalCount => _todos.length;
  int get completedCount => _todos.where((t) => t.isCompleted).length;
  int get activeCount => _todos.where((t) => !t.isCompleted).length;

  Future<void> loadTodos() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _todos = await _todoService.fetchTodos();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTodo(String content) async {
    try {
      await _todoService.addTodo(content);
      await loadTodos();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> toggleTodo(int id, bool isCompleted) async {
    try {
      await _todoService.toggleTodo(id, isCompleted);
      await loadTodos();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeTodo(int id) async {
    try {
      await _todoService.deleteTodo(id);
      await loadTodos();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}