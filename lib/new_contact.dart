import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:training_hive/models/contact.dart';

// import 'models/contact.dart';

class NewContactForm extends StatefulWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _age;

  void addContact(Contact contact) {
    final contactsBox = Hive.box('contacts');
    contactsBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  // todo: onSaved: (value) => _name = value,
                  onSaved: (value) => _name = value!,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  // todo: onSaved: (value) => _age = value,
                  onSaved: (value) => _age = value!,
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: Text('Add New Contact'),
            onPressed: () {
              // todo: _formKey.currentState.save();
              _formKey.currentState!.save();
              final newContact = Contact(_name, int.parse(_age));
              addContact(newContact);
            },
          ),
        ],
      ),
    );
  }
}
