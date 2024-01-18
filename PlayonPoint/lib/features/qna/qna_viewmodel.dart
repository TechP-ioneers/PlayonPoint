import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint1/configs/service_locator.dart';
import 'package:sprint1/models/qna_model.dart';
import 'package:sprint1/services/qna/qna_service.dart';

class QnaViewModel extends Viewmodel {
  final QnaService _qnaService = locator();
  List<Qna> _qnaList = [];
  List<Qna> get qnaList => _qnaList;
  int get count => _qnaList.length;

  Future<void> getAllQna() async {
    final list = await _qnaService.getAllQna();
    _qnaList = list;
    update();
  }

  Future<void> addQna(Qna qna) async {
    await _qnaService.addQna(qna);
    update();
  }

  Future<void> deleteQna(String id) async {
    await _qnaService.deleteQna(id);
    update();
  }

  Future<void> updateQna(String id, Qna qna) async {
    Qna updated = await _qnaService.updateQna(id, qna);
    int index = _qnaList.indexWhere((qna) => qna.id == id);
    _qnaList[index] = updated;
    update();
  }

  @override
  void init() {
    getAllQna();
    super.init();
  }
}