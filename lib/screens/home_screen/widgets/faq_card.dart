import 'dart:convert';

import 'package:master_html/resources/faqs.dart';

import '../../../constants/consts.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> faqs = jsonDecode(frequentlyAskedQuestions);
    final bool isPortraitMode = MediaQuery.of(context).orientation == Orientation.portrait ;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Card(
        child: SizedBox(
            width: double.infinity,
            height: 250,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true ;
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Frequently Asked Questions",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 20 , fontFamily: 'RobotoMedium'),
                      ),
                    ),
                    // Expanded(
                    //   child: ListView.builder(
                    //       itemCount: faqs.length,
                    //       itemBuilder: (context, index) => const ExpansionTile(
                    //             title: Text("first question"),
                    //             children: [
                    //               ListTile(
                    //                 title: Text("Hello world"),
                    //               ),
                    //               ListTile(
                    //                 title: Text("Hello world"),
                    //               ),
                    //             ],
                    //           )),
                    // ),
                    ...faqs.map((question) {
                      final List<dynamic> answers = question['answers'] ;
                      return ExpansionTile(
                        collapsedIconColor: Colors.grey,
                        iconColor: Colors.orange,
                        backgroundColor: Theme.of(context).cardTheme.color,
                        title: Text(question['question'] , style: Theme.of(context).textTheme.bodyMedium,),
                        children: answers.map((ans) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width : isPortraitMode ?  deviceWidth - 56  : deviceWidth - 90,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16 , right: 14 , bottom: 20),
                                  child: Text(ans , style: Theme.of(context).textTheme.bodySmall,),
                                )),
                          ],
                        )).toList(),
                      );
                    }).toList()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
