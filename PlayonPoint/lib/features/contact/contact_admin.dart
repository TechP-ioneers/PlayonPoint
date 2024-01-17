import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../models/contact_model.dart';
import 'contact_edit.dart';
import 'contact_viewmodel.dart';

class ContactPageAdmin extends StatelessWidget {
  const ContactPageAdmin({Key? key}) : super(key: key);

  Future<void> _editContact(
      ContactViewModel viewmodel, Contact contact, BuildContext context) async {
    Contact? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactEdit(contact: contact),
      ),
    );
    if (result == null) return;

    // foward the process to viewmodel
    viewmodel.updateContact(contact.id, result);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<ContactViewModel>(
      builder: (context, viewmodel) {
        viewmodel.getAllContact();

        return Scaffold(
          backgroundColor: const Color(0xFFb364f3),
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            title: const Text('Contact List'),
          ),
          body: ListView.builder(
            itemCount: viewmodel.count,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("${viewmodel.contactList[index].name}"),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Position: ${viewmodel.contactList[index].position}"),
                      Text("Number: ${viewmodel.contactList[index].number}"),
                    ],
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  trailing: Container(
                    width: 80, // Specify a fixed width for the Container
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _editContact(
                                viewmodel, viewmodel.contactList[index], context);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            viewmodel.deleteContact(viewmodel.contactList[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new note',
            onPressed: () {
              viewmodel.addContact(Contact(name: 'Name', position: 'Position', number: 'Number'));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
