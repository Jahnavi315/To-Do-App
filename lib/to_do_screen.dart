import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';
import 'package:to_do_app/to_do_list.dart';

class ToDoListScreen extends StatefulWidget{
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<ToDo> _toDoItems = [];
  String _enteredInput = '';
  final _textController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }
  void _askForInput(){
    _enteredInput = '';
    showDialog(
      context: context, 
      builder: (cxt) {
        // ignore: avoid_print
        _textController.text = _enteredInput;
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Enter to-do item',
            style: TextStyle( 
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20
            )
          ),
          content: TextField(  
            maxLength: 30,
            controller: _textController,
            style:TextStyle( 
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20
            ),
          ),
          actions: [ 
            TextButton(
              onPressed: (){
                Navigator.of(cxt).pop();
              }, 
              child: const Text('Cancel')
            ),
            ElevatedButton(
              onPressed: (){
                if(_textController.text.isNotEmpty){
                  _saveInput();Navigator.of(cxt).pop();
                }else{
                  //ShowSnackBar('Empty field cannot be accepted');
                  showDialog(
                    context: context, 
                    builder: (cxt) => AlertDialog( 
                      backgroundColor: Theme.of(context).colorScheme.background,
                      title: Text(
                        'Empty Field is not accepted',
                        style: TextStyle( 
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20
                        )
                      ),
                      actions: [ 
                        ElevatedButton(
                          onPressed: (){
                            Navigator.of(cxt).pop();
                          }, 
                          child: const Text('Okay')
                        )
                      ],
                    ),
                  );
                }
                
              }, 
              child: const Text('Save')
            )
          ],
        );
      },
    );
  }
  void _saveInput(){
    _enteredInput = _textController.text;
    setState(() {
      _toDoItems.add(ToDo(title: _enteredInput));
    });
  }
  /*void ShowSnackBar(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar( 
      SnackBar(
        content: Text(msg)
      )
    );
  }*/
  @override
  Widget build(BuildContext context) {
    Widget content = Center( 
    child: Text(
      'Nothing to do yet!',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith( 
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 23
      ),
      ),
    );
    if(_toDoItems.isNotEmpty){
      content = ToDoList(toDoItems: _toDoItems);
    }
    return Scaffold( 
      appBar: AppBar( 
        title: Text(
          'Your To-Do List',
          style: TextStyle( 
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 25
          ),
        ),
        actions: [ 
          IconButton(
            onPressed: _askForInput, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: content
    );
  }
}