import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'qna_viewmodel.dart';

class QnaPage extends StatelessWidget {

  const QnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<QnaViewModel>(
      builder: (context, viewmodel) => Scaffold(
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
                      fontWeight: FontWeight.bold
                      ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Answer: ${viewmodel.qnaList[index].answer}"),
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
