import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super//(key: key);

  @override
  _HomePageState createState() => _HomePageState(); //geState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกี่ยวกับการซ่อมบำรุงเครื่องจักร"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(builder: (context,snapshot) {

          var data = json.decode(snapshot.data.toString()); //[{คอมพิวเตอร์คืออะไร},{},{}]
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MyBox(data[index]['title'], data[index]['subtitle'],data[index]['image_url'],data[index]['detail']);


            },
            itemCount: data.length, );

        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),

        )
      ));
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1,v2,v3,v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      //color: Colors.blue[50],
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(image_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.50), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white70),
          ),
          SizedBox(height: 10),
          TextButton(onPressed: () {
            print("Next page >>>");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(v1,v2,v3,v4)));
          }, child: Text("อ่านต่อ"))
        ],
      ),
    );
  }
}
