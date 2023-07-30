import 'package:flutter/material.dart';
import 'package:notehub/colors.dart';
import 'package:notehub/home.dart';
import 'package:notehub/services/db.dart';

import 'model/MyNoteModel.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({ Key? key }) : super(key: key);

  @override
  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController() ;
  TextEditingController content = new TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
    //wrna ye controller space gherte h aur app ko slow banate h
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
              splashRadius: 17,
              onPressed: () async{
                await NotesDatabase.instance.InsertEntry(Note(title : title.text ,isArchive:false , content : content.text , pin : false, createdTime: DateTime.now()));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.save_outlined))
        ],
      ),

      body:
      Container(
        margin : EdgeInsets.symmetric(horizontal : 15 ,vertical: 10),
        child: Column(
          children: [
            TextField(
              cursorColor: white,
              controller: title,
              style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8))),
            ),
            Container(
              height: 300,
              child: TextField(
                cursorColor: white,
                controller: content,
                keyboardType:  TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
              ),
            )

          ],
        ),),

    );
  }
}