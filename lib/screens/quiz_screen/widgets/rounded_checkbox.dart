import '../../../constants/consts.dart';

Widget roundedCheckBox({required bool value , required Function onChanged}) {
  return Transform.scale(
    scale: 1.2,
    child: Checkbox(
      checkColor: Colors.white,
      visualDensity: VisualDensity.compact,
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.grey;
        }
        return value ? orangeColor : Colors.grey;
      }),
      value: value,
      shape: const CircleBorder(),
      onChanged: (bool? value) {
        onChanged();
      },
    ),
  );

  // return value
  //     ? const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Icon(
  //           Icons.check_circle,
  //           color: orangeColor,
  //         ),
  //     )
  //     : const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Icon(
  //           Icons.circle_outlined,
  //           color: Colors.grey,
  //         ),
  //     );
}
