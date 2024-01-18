import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'contact_viewmodel.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<ContactViewModel>(
      builder: (context, viewmodel)  => Scaffold(
          backgroundColor: const Color(0xFFb364f3),
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            title: const Text('Contact Us'),
          ),
          body: ListView.builder(
            itemCount: viewmodel.count,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("${viewmodel.contactList[index].name}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Position: ${viewmodel.contactList[index].position}"),
                      Text(
                        "Number: ${viewmodel.contactList[index].number}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}
