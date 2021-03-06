import 'package:flutter/cupertino.dart';

import 'Newsbloc.dart';
import 'newsmodel.dart';
import 'package:flutter/material.dart';
import 'Webview.dart';
//import 'Newsbloc.dart';



class News extends StatefulWidget {
  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<News> {
  Widget titleapp = Text("News App");
  //Categorynews cn = Categorynews();

  Icon actionicon = Icon(Icons.search);
  NewsBloc nb = NewsBloc();
  bool issearch = false;
  var filternews;
  var article;
  var a;

  @override
  void dispose() {
    nb.dispose();
    super.dispose();
  }

  @override
  void initState() {
//Jese hi page itialize ho tab fecth ho jae

    // nb.eventinput.add(newsaction.fetch);
    nb.getNews("entertainment");

    super.initState();
  }

  //var y = find(value);
  Widget shownews(){
  return
  StreamBuilder<List<Article>>(
  stream: nb.newsoutput,
  builder: (context, snapshot) {
  if (snapshot.hasError) {
  print(snapshot.error);
  print("jhfo");
  }
  if (snapshot.hasData) {
  return ListView.builder(
  itemCount: snapshot.data.length,
  itemBuilder: (context, index) {
  article = snapshot.data[index];

  if (issearch && a != null) {
  print(a);
  //find(value);

  //  if(article.title.contains("rahul"))

  filternews = snapshot.data;
  if (filternews[index]
      .title
      .toLowerCase()
      .contains(a.toLowerCase()))
  //   filternews = article;

  return InkWell(
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) =>
  View(Url: filternews[index].url)),
  );
  },
  child: Container(
  height: 100,
  //padding: EdgeInsets.symmetric(horizontal: 12),

  margin: const EdgeInsets.all(8),
  child: Row(children: <Widget>[
  Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(24),
  ),
  child: AspectRatio(
  child: Image.network(
  filternews[index].urlToImage,
  fit: BoxFit.cover,
  ),
  aspectRatio: 1,
  ),
  ),
  //  SizedBox(width: 16),
  Flexible(
  child: Column(
  // crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Text(
  filternews[index].title,
  style: TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold),
  ),
  Text(
  filternews[index].description,
  maxLines: 1,
  ),
  ],
  ),
  ),
  ]),
  ),
  );
  } else {
//if(issearch)
  //filternews= article;

  return InkWell(
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => View(Url: article.url)),
  );
  },
  child: Container(
  height: 100,
  //padding: EdgeInsets.symmetric(horizontal: 12),

  margin: const EdgeInsets.all(8),
  child: Row(children: <Widget>[
  Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(24),
  ),
  child: AspectRatio(
  aspectRatio: 1,
  child: Image.network(
  article.urlToImage,
  fit: BoxFit.cover,
  )),
  ),
  SizedBox(width: 16),
  Flexible(
  child: Column(
  // crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Text(
  article.title,
  style: TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold),
  ),
  Text(
  article.description,
  maxLines: 1,
  ),
  ],
  ),
  ),
  ]
  ),
  ),
  );
  }
  });
  } else
  return     Center(
    //   CircularProgressIndicator();

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text("Select Category ")
        ],
      )


  );
  },
  );
}

@override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: titleapp,
          actions: <Widget>[

            IconButton(
                icon: actionicon,
                onPressed: () {
                  setState(() {
                    this.issearch = true;
                    this.titleapp = TextField(
                      // TextField (
                      onChanged: (value) {
                        setState(() {
                          a = value;
                        });
                      },

                      //)

                      decoration: InputDecoration(
                          hintText: "find any news",
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                  });
                }
            )
          ],


        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Categories"),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text("Entertainment"),
                leading: Image.network(
                    'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'),
                onTap: () {
                  nb.getNews("entertainment");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text("Technology"),
                leading: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_rbqRlg_dukeGDrtkk3R5Lfb_wsjjxd7how&usqp=CAU"),
                onTap: () {
                  nb.getNews("science");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text("Sports"),
                leading: Image.network(
                    "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
                onTap: () {
                  nb.getNews("sports");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text("Business"),
                leading: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHxTjm-GuQ-mmukBwfTlD7a_Lvy8nvQtKG9g&usqp=CAU"),
                onTap: () {
                  nb.getNews("business");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text("Political"),
                leading: Image.asset("assets/pol.jpg"),
                onTap: () {
                  nb.getNews("politics");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
              SizedBox(height: 30),
              ListTile(
                title: Text("Health"),
                leading: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXmC4RxEvjJD-ynTIKXfDT5EJTF_tyLfd-WQ&usqp=CAU"),
                onTap: () {
                  nb.getNews("health");
                  nb.eventinput.add(newsaction.fetch);
                },
              ),
            ],
          ),
        ),



        body:
          Container(
           child: shownews()
          )

    );
  }
}















































// import 'package:flutter/material.dart';
//
// class CallsScreen extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column (
//
//           children: <Widget>[
//       Divider(
//       height: 10,
//       ),
//       ListTile(
//         leading: CircleAvatar(
//
//           // foregroundColor:Color(0xff075E54),
//           // backgroundColor:Colors.grey ,
//
//             backgroundImage: NetworkImage(
// "https://imgk.timesnownews.com/story/pjimage_-_2021-01-19T213723.931.jpg?tr=w-400,h-300,fo-auto"
//               //fit: BoxFit.fitWidth,
// //height: 70,
//               //width: 50,
//             )
//
//         ),
//         title:
//         Row(
//           children: [
//             Text("Salman"),
//             Spacer(),
//             Icon(Icons.call)
//
//           ],
//         ),
//         subtitle: Text("Yesterday 12:30 p.m."),     //  Text("04:30" ,style : TextStyle(color:Colors.grey,fontSize: 14)),
//
//       ),
//
//             ListTile(
//               leading: CircleAvatar(
//
//                 // foregroundColor:Color(0xff075E54),
//                 // backgroundColor:Colors.grey ,
//
//                   backgroundImage: NetworkImage(
//                       "https://m.media-amazon.com/images/M/MV5BZDk1ZmU0NGYtMzQ2Yi00N2NjLTkyNWEtZWE2NTU4NTJiZGUzXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY1200_CR107,0,630,1200_AL_.jpg"
//                     //fit: BoxFit.fitWidth,
// //height: 70,
//                     //width: 50,
//                   )
//
//               ),
//               title:
//               Row(
//                 children: [
//                   Text("Sharuk"),
//                   Spacer(),
//                   Icon(Icons.video_call)
//
//                 ],
//               ),
//               subtitle: Text("Yesterday 11:30 p.m."),     //  Text("04:30" ,style : TextStyle(color:Colors.grey,fontSize: 14)),
//
//             )
//
//
//       ],
//     );
//   }
//
// }