import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiPage extends StatefulWidget {
  @override
  _PostApiPageState createState() => _PostApiPageState();
}

class _PostApiPageState extends State<PostApiPage> {
  TextEditingController _titleController = TextEditingController();
  String titleValue = "";
  List<Album> _list = [];
  Future<List<Album>> _futureAlbum;
  var isLoading = false;
  var isTitleError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Title",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _titleController.clear();
                                this.titleValue = "";
                                this.isTitleError = false;
                              });
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.purpleAccent,
                            ),
                          ),
                          errorText: titleValue.trim().isEmpty && isTitleError
                              ? "Please enter title"
                              : null),
                      onChanged: (value) {
                        setState(() {
                          this.titleValue = value;
                        });
                      },
                      controller: _titleController,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  FlatButton.icon(
                    onPressed: isLoading
                        ? null
                        : () {
                            // post title to api.
                            setState(() {
                              // this._list.add(Album(id: 1, title: this.titleValue));
                              if (_titleController.text.trim().isNotEmpty) {
                                isTitleError = false;
                                createAlbum(_titleController.text);
                              } else {
                                isTitleError = true;
                              }
                            });
                          },
                    icon: Icon(
                      Icons.send,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                    label: Text(""),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<Album>>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.hasData == null) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return Container();
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  return buildListView();
                }
              },
            ),
          ))
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_list[index].title ?? ""),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: _list.length);
  }

  Future<List<Album>> createAlbum(String title) async {
    setState(() {
      isLoading = true;
    });

    final http.Response response = await http.post(
      'https://jsonplaceholder.typicode.com/albums',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 201) {
      Album album = Album.fromJson(jsonDecode(response.body));
      _list.add(album);
      return _list;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
