import 'package:flutter/material.dart';
import '../../models/contact_model.dart';

class ContactEdit extends StatefulWidget {
  final Contact contact;

  const ContactEdit({super.key, required this.contact});

  static Route route(Contact n) =>
      MaterialPageRoute(builder: (context) => ContactEdit(contact: n));

  @override
  // ignore: library_private_types_in_public_api
  _QnaEditState createState() => _QnaEditState();
}

class _QnaEditState extends State<ContactEdit> {
  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.contact.name);
    positionController = TextEditingController(text: widget.contact.position);
    numberController = TextEditingController(text: widget.contact.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => widget.contact.name = value,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: positionController,
              decoration: const InputDecoration(labelText: 'Position'),
              onChanged: (value) => widget.contact.position = value,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(labelText: 'Number'),
              onChanged: (value) => widget.contact.number = value,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save the changes and pop the screen
                    _saveChanges();
                    Navigator.pop(context, widget.contact);
                  },
                  child: const Text('Save Changes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save the changes and pop the screen
                    _saveChanges();
                    Navigator.pop(context, null);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nameController.text = "";
                    positionController.text = "";
                    numberController.text = "";
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    // Update the note with the changes
    widget.contact.name = nameController.text;
    widget.contact.position = positionController.text;
    widget.contact.number = numberController.text;

    // You may want to save the updated note to a database or perform any necessary actions here.
  }
}

