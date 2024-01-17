import 'package:sprint1/models/contact_model.dart';

abstract class ContactService {
  Future<List<Contact>> getAllContact();
  Future<Contact> addContact(Contact data);
  Future<Contact> deleteContact(String id);
  Future<Contact> updateContact(String id, Contact data);
}
