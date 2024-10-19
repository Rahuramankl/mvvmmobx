import 'dart:convert';
import 'package:mvvm/BOs/Todo_List.dart';
import 'package:http/http.dart' as http;

Future<Todo?> fetchTodo() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
  );

  if (response.statusCode == 200) {
    // Parse the JSON and return the Todo object
    return Todo.fromJson(jsonDecode(response.body));
  } else {
    // Handle error
    print('Failed to load todo');
    return null;
  }
}
