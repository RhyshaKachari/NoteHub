import 'package:flutter/material.dart';
import 'package:notehub/EditNoteView.dart';
import 'package:notehub/colors.dart';
import 'package:notehub/home.dart';
import 'package:notehub/model/MyNoteModel.dart';
import 'package:notehub/services/db.dart';
class NoteView extends StatefulWidget {
 Note? note ;
 NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.note!.pin);
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
            splashRadius: 19,
              onPressed: () async{
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
              }, icon: Icon(widget.note!.pin ? Icons.push_pin : Icons.push_pin_outlined)),
          IconButton(
              splashRadius: 19,
              onPressed: (){}, icon: Icon(Icons.archive_outlined)),
          IconButton(
              splashRadius: 19,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(note: widget.note)));
              }, icon: Icon(Icons.edit_outlined)) ,
          IconButton(
              splashRadius: 19,
              onPressed: () async{
                await NotesDatabase.instance.deleteNode(widget.note);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              }, icon: Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.note!.title, style: TextStyle(color: white ,fontSize: 23 , fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(widget.note!.content,style: TextStyle(color: white),)
          ],
        ),
      ),
    );
  }
}
