import 'package:counter_app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:counter_app/const/database_helper.dart';
import 'package:intl/intl.dart';

class AddTodoExample extends StatefulWidget {

  final Todo todo;

  const AddTodoExample({Key key, this.todo}) : super(key: key);

  @override
  _AddTodoExampleState createState() => _AddTodoExampleState();
}

class _AddTodoExampleState extends State<AddTodoExample> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController= TextEditingController();
  DatabaseHelper helper = DatabaseHelper();

  @override
  void initState() {
    setState(() {
      _titleController.text = widget.todo.title??"";
      _descriptionController.text = widget.todo.description??"";
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context,"true");
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  onChanged: (value) {

                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _descriptionController,
                  onChanged: (value) {

                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(onPressed: (){
                   if(_titleController.text.trim().isEmpty){
                     Fluttertoast.showToast(
                         msg: "Title is empty",
                         toastLength: Toast.LENGTH_SHORT,
                     );
                   }
                   else if(_descriptionController.text.trim().isEmpty){
                     Fluttertoast.showToast(
                       msg: "Description is empty",
                       toastLength: Toast.LENGTH_SHORT,
                     );
                   }
                   else{
                      // save todos in database here
                      _save(_titleController.text,_descriptionController.text);
                   }
                },
                child: Text('Add'),
                )

              ],
            ),
          ),

        ),
      ),
    );
  }

  void _save(String title,String desc) async {

    widget.todo.date = DateFormat.yMMMd().format(DateTime.now());
    widget.todo.title = title;
    widget.todo.description = desc;
    int result;
    if (widget.todo.id != null) {  // Case 1: Update operation
      result = await helper.updateTodo(widget.todo);
    } else { // Case 2: Insert Operation
      result = await helper.insertTodo(widget.todo);
    }

    if (result != 0) {
      _titleController.clear();
      _descriptionController.clear();// Success
      _showAlertDialog('Status', 'Todo Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Todo');
    }

  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(onPressed: (){
          Navigator.pop(context,"true");
        }, child: Text('Ok'))
      ],
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }


}
