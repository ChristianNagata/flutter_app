import 'package:flutter/material.dart';
import 'package:flutter_app/database/dao/contact_dao.dart';
import 'package:flutter_app/screens/contact_form.dart';
import 'package:flutter_app/screens/transferencia/formulario.dart';
import '../models/contact.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Transferir'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              if (contacts != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(
                      contact,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FormularioTransferencia(contact),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
              }
              break;
          }
          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          )
              .then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
