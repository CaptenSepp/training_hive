import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:training_hive/contact_page.dart';
import 'package:training_hive/models/contact.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await pp.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ContactAdapter(), override: true);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  @override
  void dispose() {
    Hive.box('Contacts').close();
    super.dispose();
  }
}
