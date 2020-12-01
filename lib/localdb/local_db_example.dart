import 'package:counter_app/const/database_helper.dart';
import 'package:counter_app/localdb/add_todo.dart';
import 'package:counter_app/model/todo.dart';
import 'package:flutter/material.dart';

class LocalDbExample extends StatefulWidget {
  @override
  _LocalDbExampleState createState() => _LocalDbExampleState();
}

class _LocalDbExampleState extends State<LocalDbExample> {
  List<Todo> _list = new List();
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  void initState() {
    databaseHelper.getTodoList().then((value) {
        if(value!=null){
          setState(() {
            this._list = value;
          });

        }
    })
    .catchError((error){

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Database'),

      ),
      body: ListView.builder(itemBuilder: (context, index) {
         return _list.isEmpty || _list == null ? Center(child: Container(child: Text('No todo found.'),)):
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: Card(
               elevation: 5,
               child: Column(
                 children: [
                   Text(_list[index].title??""),
                   SizedBox(height: 8,),
                   Text(_list[index].description??""),
                 ],
               )),
         );

      },
      itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: (){
           // add todos screen here
           Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoExample(todo: Todo('', ''),),));
         },

      ),
    );
  }
}
