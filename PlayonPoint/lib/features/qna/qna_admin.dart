import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../models/qna_model.dart';
import 'qna_edit.dart';
import 'qna_viewmodel.dart';

class QnaPageAdmin extends StatelessWidget {
  const QnaPageAdmin({Key? key}) : super(key: key);

  Future<void> _editQna(
      QnaViewModel viewmodel, Qna qna, BuildContext context) async {
    Qna? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QnaEdit(qna: qna),
      ),
    );
    if (result == null) return;

    // foward the process to viewmodel
    viewmodel.updateQna(qna.id, result);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<QnaViewModel>(
      builder: (context, viewmodel) {
        viewmodel.getAllQna();

        return Scaffold(
          backgroundColor: const Color(0xFFb364f3),
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
            title: const Text('Frequently Asked Questions'),
          ),
          body: ListView.builder(
            itemCount: viewmodel.count,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("Question: ${viewmodel.qnaList[index].question}"),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Answer: ${viewmodel.qnaList[index].answer}"),
                    ],
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  trailing: Container(
                    width: 80, // Specify a fixed width for the Container
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _editQna(
                                viewmodel, viewmodel.qnaList[index], context);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            viewmodel.deleteQna(viewmodel.qnaList[index].id);
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
              viewmodel.addQna(Qna(question: 'Question', answer: 'Answer'));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
