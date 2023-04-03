import 'package:url_launcher/url_launcher.dart';

import '../../../constants/consts.dart';

Widget facebookCommunityWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: InkWell(
      onTap: () async {
        Uri facebook = Uri.parse(
            "https://www.facebook.com/shimulmendes8008");
        if (await launchUrl(facebook)) {
        } else {}
      },
      child: Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.facebook_outlined,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Join our community on",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(fontSize: 35),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ) ;
}