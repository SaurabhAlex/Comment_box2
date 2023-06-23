import 'package:flutter/material.dart';

import 'commentpage.dart';

void main(){
  runApp(const Assign());

}

class Assign extends StatefulWidget {
  const Assign({Key? key}) : super(key: key);

  @override
  State<Assign> createState() => _AssignState();
}

class _AssignState extends State<Assign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          body: TabBarView(children: [
            Container(color: Colors.indigoAccent.shade100,),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                            backgroundColor: Colors.grey.shade200,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                          ), child: const Text("Add Comments",style: TextStyle( fontSize: 22, color: Colors.black),),
                        ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 200,
                    child: Image.asset("images/Image.jpg"),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: ( ) {},
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: const Icon(Icons.search)),),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            hintText: "Search",
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(child: Commentarea())
                ],
              ),
                  ),            
            Container(color: Colors.cyanAccent,),
            Container(color: Colors.purple,),

          ]),
          bottomNavigationBar: Container(
            child: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home,color: Colors.black87,size: 35),child: Text("Home",style: TextStyle(
              fontSize: 10, color: Colors.black87, fontWeight: FontWeight.bold
          ),),),
          Tab(icon: Icon(Icons.add_card,color: Colors.black87,size: 35),child: Text("Add Card",style: TextStyle(
              fontSize: 9, color: Colors.black87, fontWeight: FontWeight.bold
          ),),),
          Tab(icon: Icon(Icons.newspaper,color: Colors.black87,size: 35),child: Text("NEWS",style: TextStyle(
              fontSize: 10, color: Colors.black87, fontWeight: FontWeight.bold
          ),),),
          Tab(icon: Icon(Icons.person_2_rounded   ,color: Colors.black87,size: 35),child: Text("Profile",style: TextStyle(
              fontSize: 10, color: Colors.black87, fontWeight: FontWeight.bold, ),),),

            ],
          )
          )
        ),
      ),
    );
  }
}
