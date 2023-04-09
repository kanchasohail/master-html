import '../../../constants/consts.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result-screen';
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String , dynamic> argData = ModalRoute.of(context)?.settings.arguments as Map<String , dynamic> ;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Result"),
      ),
      body:  Center(
        child: Column(
          children: [
            Text('Total questions ${argData['total_questions']}'),
            Text('Correct Answers ${argData['correct_answers']}'),
          ],
        ),
      ),
    );
  }
}
