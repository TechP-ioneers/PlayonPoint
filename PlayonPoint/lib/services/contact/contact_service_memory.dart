import 'package:sprint1/models/contact_model.dart';
import 'package:sprint1/services/contact/contact_service.dart';

class ContactServiceMemory extends ContactService {
  final List<Contact> _contact = [
    Contact(
        id: '1', name: 'Mr. Sharul bin Mohd. Shahimi', number: '07-5536227', position:'Sports & Youth Officer'),
    Contact(
        id: '2', name: 'Mr. Azman bin Jamalludin', number: '07-5536227', position: 'Sports & Youth Assistance Officer'),
  ];

  @override
  Future<Contact> addContact(Contact data) async {
    int index = _contact.length;
    _contact.insert(index, data);
    return (_contact[index]);
  }

  @override
  Future<Contact> deleteContact(String id) async {
    final index = _contact.indexWhere((qna) => qna.id == id);
    _contact.removeAt(index);
    return (_contact[index]);
  }

  @override
  Future<List<Contact>> getAllContact() async {
    return _contact;
  }

  @override
  Future<Contact> updateContact(String id, Contact data) async {
    final index = _contact.indexWhere((qna) => qna.id == id);
    _contact[index] = data;
    return _contact[index];
  }
}
