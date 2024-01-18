import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/models/contact_model.dart';
import 'package:sprint1/services/contact/contact_service.dart';

class ContactViewModel extends Viewmodel {
  final ContactService _contactService = locator();
  List <Contact> _contactList = [];
  List <Contact> get contactList => _contactList;
  int get count => _contactList.length;

  Future<void> getAllContact() async {
    final list = await _contactService.getAllContact();
    _contactList = list;
    update();
  }

  Future<void> addContact(Contact contact) async {
    await _contactService.addContact(contact);
    update();
  }

  Future<void> deleteContact(String id) async {
    await _contactService.deleteContact(id);
    update();
  }

  Future<void> updateContact(String id, Contact contact) async {
    await _contactService.updateContact(id, contact);
    update();
  }

    @override
  void init() {
    getAllContact();
    super.init();
  }
}