import 'package:flutter/material.dart';
import 'package:notehub/NoteView.dart';
import 'package:notehub/SearchPage.dart';
import 'package:notehub/SideMenuBar.dart';
import 'package:notehub/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notehub/services/auth.dart';
import 'package:notehub/services/db.dart';
import "package:stack_trace/stack_trace.dart";
import 'package:notehub/model/MyNoteModel.dart';
import 'package:notehub/services/login_info.dart';
import 'CreateNoteView.dart';
import 'login.dart';
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true ;
  late List<Note> notesList;
  late String? ImgUrl ;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note = "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS NOTE  THIS IS NOTE THIS IS NOTE THIS IS NOTE ";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE  THIS IS ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  createEntry(Note(pin: false, title: "Welcome to Notehub", content: "la l ala all a",isArchive: false, createdTime: DateTime.now()));
  getAllNotes();
  }
  //to create note
  Future createEntry(Note note) async{
    await NotesDatabase.instance.InsertEntry(note);
  }
  //to read notes
  Future getAllNotes() async{
  LocalDataSaver.getImg().then((value){
    if(this.mounted){
      setState(() {
        ImgUrl = value ;
      });
    }
  });
   this.notesList =  await NotesDatabase.instance.readAllNotes();
   if(this.mounted){
     setState(() {
       isLoading = false;
     });
   }
   }


  //to get one note
  Future getOneNote(int id) async{
    await NotesDatabase.instance.readOneNote(id);
  }

  //to update one note
  Future  updateOneNote(Note note) async{
    await NotesDatabase.instance.updateNote(note);
  }

  //to delete one note
  Future deleteOneNote(Note note) async{
    await NotesDatabase.instance.deleteNode(note);
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold( backgroundColor: bgColor, body: Center(child: CircularProgressIndicator(color: Colors.white,),),) : Scaffold(
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
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView()));
                            },
                            child: Container(
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
                            GestureDetector(
                              onTap: (){
                                signOut();
                                LocalDataSaver.saveLoginData(false);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                              },
                              child: CircleAvatar(
                                onBackgroundImageError: (Object, StackTrace){
                                 print("Ok") ;
                                },
                                radius: 16,
                                backgroundImage: NetworkImage(ImgUrl.toString()),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                NoteSectionAll(),
                ColorNotes(),
                NotesListSection(),







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
          itemCount: notesList.length,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          itemBuilder: (context,index)=>   InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: notesList[index])));
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
                  Text(notesList[index].title, style: TextStyle(color: white, fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(notesList[index].content.length > 250 ? "${notesList[index].content.substring(0,250)}...":notesList[index].content ,style: TextStyle(color: white),)
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

  Widget ColorNotes(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15,),
      child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          itemBuilder: (context,index)=>   Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: index.isEven ? skyblue : queenpink,
              border: Border.all(color: index.isEven ? skyblue.withOpacity(0.4) : queenpink.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HEADING", style: TextStyle(color: white, fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(index.isEven? note.length > 250 ? "${note.substring(0,250)}...":note:note1 ,
                  style: TextStyle(color: white),)
              ],),
          )
      ),
    );

  }
}
