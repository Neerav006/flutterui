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
           padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
           child: GestureDetector(
             onTap: () async {
               // add todos screen here
               String  result =  await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoExample(todo: _list[index],),));
               if(result!=null){
                 databaseHelper.getTodoList().then((value) {
                   if(value!=null){
                     setState(() {
                       this._list = value;
                     });

                   }
                 })
                     .catchError((error){

                 });
               }
             },
             child: Card(
                 elevation: 5,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(_list[index].title??"",style: Theme.of(context).textTheme.subtitle1,),
                             SizedBox(height: 4,),
                             Text(_list[index].description??""),
                           ],
                         ),
                       ),
                       InkWell(
                           onTap: (){
                             // delete todos
                             deleteTodo(_list[index]).then((value) {
                                 setState(() {
                                   databaseHelper.getTodoList().then((value) {
                                     if(value!=null){
                                       setState(() {
                                         this._list = value;
                                       });

                                     }
                                   })
                                       .catchError((error){

                                   });
                                 });
                             })
                             .catchError((error){

                             });
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.delete,color: Colors.red,),
                           )
                       )
                     ],
                   ),
                 )),
           ),
         );

      },
      itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () async {
           // add todos screen here
          String  result =  await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTodoExample(todo: Todo('', ''),),));
          if(result!=null){
            databaseHelper.getTodoList().then((value) {
              if(value!=null){
                setState(() {
                  this._list = value;
                });

              }
            })
                .catchError((error){

            });
          }
         },

      ),
    );
  }

   Future<void> deleteTodo(Todo todo) async {
    await databaseHelper.deleteTodo(todo.id);
   }
}
