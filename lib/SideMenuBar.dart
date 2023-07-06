import 'package:flutter/material.dart';
import 'package:notehub/colors.dart';

import 'ArchiveView.dart';
import 'Setting.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25 , vertical: 16),
                  child: Text("NoteHub" , style: TextStyle(color: white , fontWeight: FontWeight.bold, fontSize: 25),)),
              Divider(
                color: white.withOpacity(0.3),
              ),
        Container(
          // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
          margin: EdgeInsets.only(right: 10),
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)
                        ),)
                  )
              )
              ,
              onPressed: (){
              }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
            child: Row(
              children: [
                Icon(Icons.book ,
                  size: 30,) ,
                SizedBox(
                  width: 27,
                ),
                Text("Notes" , style: TextStyle(color: white.withOpacity(0.7) ,
                    fontSize:18),),

              ],
            ),
          )),
        ),
              SizedBox(height: 5,),
        Container(
          // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
          margin: EdgeInsets.only(right: 10),
          child: TextButton(
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)
                        ),)
                  )
              )
              ,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Archive()));
              }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
            child: Row(
              children: [
                Icon(Icons.archive_outlined ,
                  size: 30,) ,
                SizedBox(
                  width: 27,
                ),
                Text("Archive" , style: TextStyle(color: white.withOpacity(0.7) ,
                    fontSize:18),),

              ],
            ),
          )),
        ),
              SizedBox(height: 5,),



        Container(
          // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
          margin: EdgeInsets.only(right: 10),
          child: TextButton(
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)
                        ),)
                  )
              )
              ,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
            child: Row(
              children: [
                Icon(Icons.settings ,
                  size: 30,) ,
                SizedBox(
                  width: 27,
                ),
                Text("Settings" , style: TextStyle(color: white.withOpacity(0.7) ,
                    fontSize:18),),

              ],
            ),
          )),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
// Widget sectionOne(){
//   return Container(
//     // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//     margin: EdgeInsets.only(right: 10),
//     child: TextButton(
//         style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(50),
//                       bottomRight: Radius.circular(50)
//                   ),)
//             )
//         )
//         ,
//         onPressed: (){
//         }, child: Container(
//       padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//       child: Row(
//         children: [
//           Icon(Icons.book ,
//             size: 30,) ,
//           SizedBox(
//             width: 27,
//           ),
//           Text("Notes" , style: TextStyle(color: white.withOpacity(0.7) ,
//               fontSize:18),),
//
//         ],
//       ),
//     )),
//   );
// }
//
//
//
//
//

// Widget sectionTwo(){
//   return Container(
//     // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//     margin: EdgeInsets.only(right: 10),
//     child: TextButton(
//         style: ButtonStyle(
//             // backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(50),
//                       bottomRight: Radius.circular(50)
//                   ),)
//             )
//         )
//         ,
//         onPressed: (){
//         }, child: Container(
//       padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//       child: Row(
//         children: [
//           Icon(Icons.archive_outlined ,
//             size: 30,) ,
//           SizedBox(
//             width: 27,
//           ),
//           Text("Archive" , style: TextStyle(color: white.withOpacity(0.7) ,
//               fontSize:18),),
//
//         ],
//       ),
//     )),
//   );
// }




// Widget settings_section(){
//   return Container(
//     // padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//     margin: EdgeInsets.only(right: 10),
//     child: TextButton(
//         style: ButtonStyle(
//           // backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.3)),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(50),
//                       bottomRight: Radius.circular(50)
//                   ),)
//             )
//         )
//         ,
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
//         }, child: Container(
//       padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
//       child: Row(
//         children: [
//           Icon(Icons.settings ,
//             size: 30,) ,
//           SizedBox(
//             width: 27,
//           ),
//           Text("Archive" , style: TextStyle(color: white.withOpacity(0.7) ,
//               fontSize:18),),
//
//         ],
//       ),
//     )),
//   );
// }