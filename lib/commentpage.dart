import 'dart:convert';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Commentarea extends StatefulWidget {
  @override
  _CommentareaState createState() => _CommentareaState();
}

class _CommentareaState extends State<Commentarea> {
  List<Photos> photoList =[];
  Future<List<Photos>> getPhotos()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i["title"], thumbnailUrl: i["thumbnailUrl"]);
        photoList.add(photos);
      }
      return photoList;
    }else{
      return photoList;
    }
  }

  Future<List<Photos>> createComment(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
            print('created') ;
      var abcr = jsonDecode(response.body);
      for(Map i in abcr){
        Photos photos = Photos(title: i["title"], thumbnailUrl: i["thumbnailUrl"]);
        photoList.add(photos);}
      return photoList;

    } else {
      throw Exception('Failed to create album.');
    }
  }


  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List data = [
    {
      'albumId': 1,
      'id': 1,
      'title': "accusamus beatae ad facilis cum similique qui sunt",
      'url': "https://via.placeholder.com/600/92c952",
      'thumbnailUrl': "https://via.placeholder.com/150/92c952"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < data.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () async {
                    print("Comment Clicked");
                  },
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: CommentBox.commentImageParser(
                            imageURLorPath: data[i]['thumbnailUrl'])),
                  ),
                ),
                title: Text(
                  data[i]['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(icon: const Icon(Icons.add), onPressed: ()  {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        icon: const Text("Type Below", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        title:TextFormField(
                          controller: controller,
                          onTap: () {} ,
                          decoration: const InputDecoration(
                              hintText: "Comment"
                          ),
                        ),
                        content: TextButton(
                          onPressed: () {
                            createComment(controller.text);
                            Navigator.pop(context);
                            setState(() {
                              var value = {
                                'albumId': 1,
                                'id': 1,
                                'title': controller.text,
                                'url': "https://via.placeholder.com/600/92c952",
                                'thumbnailUrl': "https://via.placeholder.com/150/92c952"
                              };
                              data.insert(1, value);
                            });
                            final snackBar = SnackBar(
                              content: const Text('New comment was added!',style: TextStyle(color: Colors.black),),
                              backgroundColor: Colors.grey,
                              action: SnackBarAction(
                                backgroundColor: Colors.grey.shade300,
                                textColor: Colors.black,
                                label: "Done",
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          },
                          style:TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )),
                          child: const Text('Add',style: TextStyle(color: Colors.black,fontSize: 18)),
                        )
                    ),
                  );
                },),
              ),

            ),

        ],
      )
    );
  }
}

class Photos {
  String title , thumbnailUrl ;
  Photos({required this.title, required this.thumbnailUrl});
}

