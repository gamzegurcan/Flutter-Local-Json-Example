import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Person Json App')
          ),
        ),
        body: Center(
          child: Container(
              child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var myData = JsonDecoder().convert(snapshot.data.toString());
              return ListView.builder(
                itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Name: " + myData[index]['name']),
                      Text("Age: " + myData[index]['age']),
                      Text("Height: " + myData[index]['height']),
                      Text("Gender: " + myData[index]['gender']),
                      Text("Hair Color: " + myData[index]['hair_color'])
                    ],
                  ),
                );
              });
            },
          )),
        ),
      ),
    );
  }
}
