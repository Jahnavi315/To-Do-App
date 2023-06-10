import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';

class ToDoItem extends StatefulWidget{
  const ToDoItem({super.key,required this.toDoItem});
  final ToDo toDoItem;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile( 
      leading: Checkbox(
        value: isChecked, 
        onChanged: (onChange){
          if(onChange != null){
            setState(() {
              isChecked = onChange;
            });
          }
        }
      ),
      title: Text(
        widget.toDoItem.title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith( 
          color:  Theme.of(context).colorScheme.onBackground,
          fontSize: 22
        ),
      ),
      );
  }
}