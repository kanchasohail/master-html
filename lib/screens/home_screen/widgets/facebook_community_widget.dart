import 'package:url_launcher/url_launcher.dart';

import '../../../constants/consts.dart';

Widget facebookCommunityWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: GestureDetector(
      onTap: () async {
        Uri facebook = Uri.parse(
            "https://www.facebook.com/shimulmendes8008");
        if (await launchUrl(facebook)) {
        } else {}
      },
      child: const Card(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.facebook_outlined,
                size: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join our community on",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(fontSize: 31 , fontFamily: "Montserrat"),
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