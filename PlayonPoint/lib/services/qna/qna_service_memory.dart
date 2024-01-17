import 'package:sprint1/models/qna_model.dart';
import 'package:sprint1/services/qna/qna_service.dart';

class QnaServiceMemory extends QnaService {
  final List<Qna> _qna = [
    Qna(id: '1', question: 'Where art thou?', answer: 'Here I am!'),
    Qna(id: '2', question: 'What is your name?', answer: 'My name is John'),
    Qna(id: '3', question: 'What is your quest?', answer: 'To seek the Holy Grail'),
    Qna(id: '4', question: 'What is your favorite color?', answer: 'Blue'),
    Qna(id: '5', question: 'What is the capital of Assyria?', answer: 'I don\'t know that'),
  ];

  @override
  Future<Qna> addQna(Qna data) async {
    int index = _qna.length;
    _qna.insert(index, data);
    return (_qna[index]);
  }

  @override
  Future<Qna> deleteQna(String id) async {
    final index = _qna.indexWhere((qna) => qna.id == id);
    _qna.removeAt(index);
    return (_qna[index]);
  }

  @override
  Future<List<Qna>> getAllQna() async {
    return _qna;
  }

  @override
  Future<Qna> updateQna(String id, Qna data) async{
    final index = _qna.indexWhere((qna) => qna.id == id);
    _qna[index] = data;
    return _qna[index];
  }
}
