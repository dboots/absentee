import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;

  const IconCircle({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.white30),
              child: InkWell(
                  onTap: onPressed,
                  child:
                      Padding(padding: const EdgeInsets.all(5.0), child: icon)))
        ]);
  }
}
