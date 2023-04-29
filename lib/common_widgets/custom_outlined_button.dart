import '../constants/consts.dart';

Widget customOutlinedButton({required VoidCallback onPressed , required String buttonText}){
  return Container(
    // margin: const EdgeInsets.only(top: 20.0 , bottom: 12 , right: 16 , left: 16),
    decoration: BoxDecoration(
        border: Border.all(color: orangeColor , width: 0.2),
        borderRadius: BorderRadius.circular(4)
    ),
    child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text(buttonText , style: const TextStyle(color: orangeColor , fontWeight: FontWeight.bold , fontSize: 15),),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_forward_ios , size: 16,)
          ],
        ),
      ),
    ),
  );
}