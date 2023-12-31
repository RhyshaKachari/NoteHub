import 'package:flutter/material.dart';
import 'package:notehub/colors.dart';
import 'package:notehub/services/db.dart';
import 'NoteView.dart';
import 'model/MyNoteModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<int> SearchResultIDs = [];
  List<Note?> SearchResultNotes = [];

  bool isLoading = false;

  void SearchResults(String query) async{
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds = await NotesDatabase.instance.getNoteString(query); //= [1,2,3,4,5]
    List<Note?> SearchResultNotesLocal = []; //[nOTE1, nOTE2]
    ResultIds.forEach((element) async{
      final SearchNote = await NotesDatabase.instance.readOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {

        SearchResultNotes.add(SearchNote);

      });
    });

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: white.withOpacity(0.1)),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_outlined) , color: white, ),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      //ye textInputAction wale se keyboard ka search button kaam krnge legag jb bhi humko kch search krna hoga tb
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Search Your Notes",
                        hintStyle:
                        TextStyle(color: white.withOpacity(0.5), fontSize: 16),
                      ),
                      onSubmitted: (value){
                        setState(() {
                          SearchResults(value.toLowerCase());
                        });
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
  Widget NoteSectionAll() {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "SEARCH RESULTS",
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
                child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: SearchResultNotes.length,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 4,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: SearchResultNotes[index])));
                          },
                          child:
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: white.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(SearchResultNotes[index]!.title,
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(SearchResultNotes[index]!.content.length > 250
                                    ? "${SearchResultNotes[index]!.content.substring(0, 250)}..."
                                    : SearchResultNotes[index]!.content,

                                  style: TextStyle(color: white),
                                )
                              ],
                            ),
                          ),

                        )
                )
            ),
          ],
        )
    );
  }



}

