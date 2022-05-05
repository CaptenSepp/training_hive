import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:training_hive/new_contact.dart';

import 'models/contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive Tutorial'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _ListView()),
            NewContactForm(),
          ],
        ));
  }

  Widget _ListView() {
    var contactsBox = Hive.box('contacts');
    return ValueListenableBuilder(
      valueListenable: Hive.box('contacts').listenable(),
      builder: (context, Box box, _) {
        return ListView.builder(
          itemCount: contactsBox.values.length,
          itemBuilder: (context, index) {
            final contact = contactsBox.getAt(index);

            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.age.toString()),
              // trailing: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     IconButton(
              //       icon: Icon(Icons.refresh),
              //       onPressed: () {
              //         contactsBox.putAt(
              //           index,
              //           Contact('${contact.name}*', contact.age + 1),
              //         );
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.delete),
              //       onPressed: () {
              //         contactsBox.deleteAt(index);
              //       },
              //     )
              //   ],
              // ),
            );
          },
        );
      },
    );
  }
}
