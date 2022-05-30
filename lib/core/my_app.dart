import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../modules/home/screens/contact_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiveApp',
      home: FutureBuilder(
        future: Hive.openBox('contacts'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ContactPage();
            }
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: Text('snapshot.coonnectiostate is not done'),
              ),
              body: Text('snapshot.coonnectiostate is not done'),
            );
          }
        },
      ),
    );
  }
}