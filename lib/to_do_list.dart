import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';
import 'package:to_do_app/todo_item.dart';

class ToDoList extends StatelessWidget{
  const ToDoList({super.key,required this.toDoItems});

  final List<ToDo> toDoItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:  toDoItems.length,
      itemBuilder: (context, index) => ToDoItem(toDoItem: toDoItems[index])
    );
  }
}