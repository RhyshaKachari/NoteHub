import 'package:flutter/material.dart';
import 'package:notehub/colors.dart';
import 'package:notehub/services/db.dart';
import 'model/MyNoteModel.dart';
import 'NoteView.dart';

class EditNoteView extends StatefulWidget {
Note? note ;
EditNoteView({required this.note}) ;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String NewTitle ;
  late String NewNoteDet ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.NewTitle = widget.note!.title.toString();
    this.NewNoteDet = widget.note!.content.toString();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor,elevation: 0.0,
      actions: [
       IconButton(
         splashRadius: 19,
           onPressed: () async{
           Note newNote = Note(pin: widget.note!.pin, id: widget.note!.id,
               isArchive: widget.note!.isArchive
               ,content: NewNoteDet , title: NewTitle , createdTime: widget.note!.createdTime);
           await NotesDatabase.instance.updateNote(newNote);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteView(note: newNote)));
           }, icon: Icon(Icons.save))
      ],),
      body: Container(
        margin : EdgeInsets.symmetric(horizontal : 15 ,vertical: 10),
        child: Column(
          children: [
            Form(
              child: TextFormField(
               initialValue: NewTitle,
                cursorColor: white,
                onChanged: (value){
                 NewTitle = value ;
                },
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
            ),
            Container(
              height: 300,
              child: Form(
                child: TextFormField(
                  initialValue: NewNoteDet,
                  cursorColor: white,
                  onChanged: (value){
                    NewNoteDet = value ;
                  },
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
              ),
            )

          ],
        ),),

    );
  }
}
