import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatchat/gc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'groupkibaat.dart';


class GroupList extends StatefulWidget{

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {




  List<dynamic> user =[];

Widget showgList(){
  return
  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("GroupRoom").snapshots(),

      builder: (context,snapshot){



  return snapshot.hasData
  ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context,index){
              return
                  Column(
                    children: [
                      Divider(
                        height: 10,
                      ),
                      ListTile(


                        leading: CircleAvatar(
                            radius: 28,

                            foregroundColor:Color(0xff075E54),
                            backgroundColor:Colors.grey ,
                            backgroundImage: NetworkImage(
                              snapshot.data.docs[index]["URL"],

                            )

                        ),

                              title :  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  GestureDetector(onTap: (){
                                  print("oko");

                                  print(snapshot.data.docs[index]["users"]);

                                  Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => Groupkibaat(snapshot.data.docs[index]["grouproomid"],snapshot.data.docs[index]["users"],snapshot.data.docs[index]["URL"])));

                                  } , child: Text(snapshot.data.docs[index]["grouproomid"] ,
                                    style: TextStyle(fontWeight: FontWeight.bold  ,color: Colors.black,fontSize: 18) ,  ) ),
                                  Container(
                                    margin: EdgeInsets.only(left: 145),
                                    child:   Text( snapshot.data.docs[index]["lasttime"],
                                   //   '${DateFormat.Hm().format(snapshot.data.docs[index]["lasttime"].toDate())}',
                                      style: TextStyle(color: Colors.black38 , fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                          subtitle: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(snapshot.data.docs[index]["lastmsg"]))
                      ),


                    ],
                  );

              }):CircularProgressIndicator();

        }




  );

}




  @override
  Widget build(BuildContext context) {
return//MaterialApp(
 // debugShowCheckedModeBanner: false,
  Scaffold(
      body: showgList()
  //),
);

  }
}