import 'package:flutter/material.dart';
import 'package:notehub/SideMenuBar.dart';
import 'package:notehub/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerKey,
      drawer: SideMenu(),
      backgroundColor: bgColor,
      body : SafeArea(
        child: Container(
          child: Column(
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
              )
            ],
          ),
        ),
      )
    );
  }
}
