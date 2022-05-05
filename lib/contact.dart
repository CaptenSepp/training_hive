import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold in contact page'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text('Name'),
                subtitle: Text('Age'),
              )
            ],
          ))
        ],
      ),
    );
  }
}
