import '../../models/qna_model.dart';

abstract class QnaService {
  Future<List<Qna>> getAllQna();
  Future<Qna> addQna(Qna data);
  Future<Qna> deleteQna(String id);
  Future<Qna> updateQna(String id, Qna data);
}