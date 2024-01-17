import 'package:flutter/material.dart';
import '../../models/qna_model.dart';

class QnaEdit extends StatefulWidget {
  final Qna qna;

  const QnaEdit({super.key, required this.qna});

  static Route route(Qna n) =>
      MaterialPageRoute(builder: (context) => QnaEdit(qna: n));

  @override
  // ignore: library_private_types_in_public_api
  _QnaEditState createState() => _QnaEditState();
}

class _QnaEditState extends State<QnaEdit> {
  late TextEditingController questionController;
  late TextEditingController answerController;

  @override
  void initState() {
    super.initState();
    questionController = TextEditingController(text: widget.qna.question);
    answerController = TextEditingController(text: widget.qna.answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(0xFFb364f3),
          appBar: AppBar(
            backgroundColor: Colors.lightGreenAccent,
        title: const Text('Edit Qna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
              onChanged: (value) => widget.qna.question = value,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
              onChanged: (value) => widget.qna.answer = value,
            ),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                    Navigator.pop(context, widget.qna);
                  },
                  child: const Text('Save Changes'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                    Navigator.pop(context, null);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    questionController.text = "";
                    answerController.text = "";
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
    widget.qna.question = questionController.text;
    widget.qna.answer = answerController.text;
    }
}
