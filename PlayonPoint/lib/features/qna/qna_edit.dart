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
      appBar: AppBar(
        title: const Text('Edit Note'),
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save the changes and pop the screen
                    _saveChanges();
                    Navigator.pop(context, widget.qna);
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
    // Update the note with the changes
    widget.qna.question = questionController.text;
    widget.qna.answer = answerController.text;

    // You may want to save the updated note to a database or perform any necessary actions here.
  }
}

