import 'package:flutter/material.dart';
import 'package:notehub/NoteView.dart';
import 'package:notehub/SideMenuBar.dart';
import 'package:notehub/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:stack_trace/stack_trace.dart";

import 'CreateNoteView.dart';
class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note = "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE ";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNoteView()) );
          },
          backgroundColor: cardColor,
          child: Icon(Icons.add , size: 45,),
        ),
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: SideMenu(),
        backgroundColor: bgColor,
        body : SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8 ),
                    width: MediaQuery.of(context).size.width,
                    height: 55,

                    decoration: BoxDecoration(

                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [BoxShadow(color: lavender,spreadRadius: 1 , blurRadius: 3),]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: () {
                              _drawerKey.currentState!.openDrawer();
                            }, icon: Icon(Icons.menu , color: white,)),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              height: 55,
                              width: 178,
                              // decoration: BoxDecoration(border:Border.all(color: Colors.white) ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Search Your Notes" , style: TextStyle(color: white.withOpacity(0.5) , fontSize: 16),),
                                ],
                              ),
                            )
                          ],
                        ),


                        Container(
                          // margin:EdgeInsets.symmetric(horizontal: 10) ,
                          child: Row(

                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateColor.resolveWith((states) => white.withOpacity(0.1)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          )
                                      )
                                  )
                                  ,onPressed: () {}, child: Icon(Icons.grid_view , color: white,)),
                              // SizedBox(
                              //   // width: 9,
                              // ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white,
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  NoteSectionAll(),
                  NotesListSection(),



                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15,),
                  //   child: StaggeredGridView.countBuilder(
                  //       physics: NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       itemCount: 10,
                  //       mainAxisSpacing: 12,
                  //       crossAxisSpacing: 12,
                  //       crossAxisCount: 4,
                  //       staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  //       itemBuilder: (context,index)=>   Container(
                  //         padding: EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //           color: index.isEven ? skyblue : queenpink,
                  //           border: Border.all(color: index.isEven ? skyblue.withOpacity(0.4) : queenpink.withOpacity(0.4)),
                  //           borderRadius: BorderRadius.circular(7),
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text("HEADING", style: TextStyle(color: white, fontSize: 20,fontWeight: FontWeight.bold),),
                  //             SizedBox(height: 10,),
                  //             Text(index.isEven? note.length > 250 ? "${note.substring(0,250)}...":note:note1 ,
                  //               style: TextStyle(color: white),)
                  //           ],),
                  //       ) ),
                  // ),



                ],
              ),
            ),
          ),


        )
    );
  }
  Widget NoteSectionAll(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25 , vertical: 10),
          child: Column(
            children: [
              Text("ALL" , style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),




        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15,),
          child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (context,index)=>   InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: ,)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: skyblue,
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HEADING", style: TextStyle(color: white, fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(index.isEven? note.length > 250 ? "${note.substring(0,250)}...":note:note1 ,style: TextStyle(color: white),)
                    ],),
                ),
              ) ),
        ),
      ],
    );

  }
  Widget NotesListSection() {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "LIST VIEW",
                    style: TextStyle(
                        color: white.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("HEADING",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          index.isEven
                              ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                              : note1,
                          style: TextStyle(color: white),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
