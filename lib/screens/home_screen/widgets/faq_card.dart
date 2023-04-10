import 'package:master_html/resources/faqs.dart';
import 'package:master_html/resources/models/faq_model.dart';

import '../../../constants/consts.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FAQModel> faqs = frequentlyAskedQuestions.map((e) => FAQModel(question: e['question'], answers: e['answers'].toList())).toList() ;
    final bool isPortraitMode = MediaQuery.of(context).orientation == Orientation.portrait ;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0 , bottom: 6),
                  child: Text(
                    "Frequently Asked Questions",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 20 , fontFamily: 'RobotoMedium'),
                  ),
                ),
                Expanded(
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
                          ...faqs.map((question) {
                            final List<dynamic> answers = question.answers ;
                            return ExpansionTile(
                              collapsedIconColor: Colors.grey,
                              childrenPadding: const EdgeInsets.only(left: 18 , right: 18 ),
                              iconColor: Colors.orange,
                              backgroundColor: Theme.of(context).cardTheme.color,
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 6.0 , top: 2 ),
                                child: Text(question.question , style: Theme.of(context).textTheme.bodyMedium,),
                              ),
                              children: answers.map((ans) => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width : isPortraitMode ?  deviceWidth - 76  : deviceWidth - 105,
                                      child: Text(ans , style: Theme.of(context).textTheme.bodySmall,)),
                                ],
                              )).toList(),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),),
      ),
    );
  }
}
