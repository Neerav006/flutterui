import 'package:flutter/material.dart';

class BasicWidgetExp extends StatefulWidget {
  @override
  _BasicWidgetExpState createState() => _BasicWidgetExpState();
}

class _BasicWidgetExpState extends State<BasicWidgetExp> {

  List<bool> isSelected = [true,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Widgets'),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [

         Padding(
         padding: const EdgeInsets.symmetric(horizontal: 30.0),
         child: Column(
           children: <Widget>[
             SizedBox(height: 20.0),
             Card(
               elevation: 2,

               child: ExpansionTile(
                 title: Text(
                   "Title",
                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                 ),
                 children: <Widget>[
                   ExpansionTile(
                     title: Text(
                       'Sub title',
                     ),
                     children: <Widget>[
                       ListTile(
                         title: Text('data'),
                       )
                     ],
                   ),
                   ListTile(
                     title: Text('data'),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Chip(
               deleteIcon: Icon(
                 Icons.cancel
               ),
               onDeleted: (){

               },
               avatar: CircleAvatar(
                 backgroundColor: Theme.of(context).accentColor,
                 child: Text('N'),
               ),
               label: Text('Nirav'),
             )
             ,
             SizedBox(
               height: 20,
             ),
             ToggleButtons(
               borderColor: Colors.black,
               fillColor: Colors.grey,
               borderWidth: 2,
               selectedBorderColor: Colors.black,
               selectedColor: Colors.white,
               borderRadius: BorderRadius.circular(0),
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     'Open 24 Hours',
                     style: TextStyle(fontSize: 16),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     'Custom Hours',
                     style: TextStyle(fontSize: 16),
                   ),
                 ),
               ],
               onPressed: (index) {
                 setState(() {
                   isSelected[index] = !isSelected[index];
                 });
               },
               isSelected: isSelected,
             ),
           ],
         ),
       ),

           ],
         ),

       )
    ,
    );
  }


}
class ExpansionpanelItem {
  bool isExpanded;
  final String title;
  final Widget content;
  final Icon leading;
  ExpansionpanelItem({this.isExpanded, this.title, this.content, this.leading});
}