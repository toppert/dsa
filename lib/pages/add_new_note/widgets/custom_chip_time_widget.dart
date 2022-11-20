import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChipTimeWidget extends StatelessWidget {
  final TimeOfDay? date;
  final Function() onPressed;
  final TextStyle? textStyle;
  final String? title;

  const CustomChipTimeWidget(
      {Key? key, required this.date, required this.onPressed,  this.textStyle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customChips(context: context, date: date, onPressed: onPressed);
  }

  customChips(
      {TimeOfDay? date,
      required Function() onPressed,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Text(
            "$title",
            style: textStyle,
          ),
          const SizedBox(height: 5,),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(CupertinoIcons.clock_solid, size: 20),
                Text(
                  "${date?.format(context)}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
