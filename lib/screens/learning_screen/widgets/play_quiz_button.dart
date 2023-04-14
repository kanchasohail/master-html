import '../../../constants/consts.dart';

Widget playQuizButton({required VoidCallback onPressed}){
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Play Quiz" , style: TextStyle(color: orangeColor , fontWeight: FontWeight.bold),),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios ,)
        ],
      ),
    ),
  );
}