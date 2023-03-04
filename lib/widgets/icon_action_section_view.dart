import 'package:flutter/material.dart';

class IconActionSectionView extends StatelessWidget {
  IconActionSectionView({
    Key? key,
    required this.iconAction
  }) : super(key: key);

  final IconData iconAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 64, 66, 50),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Icon(
        iconAction,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
