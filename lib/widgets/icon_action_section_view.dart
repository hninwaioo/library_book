import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';

class IconActionSectionView extends StatelessWidget {
  IconActionSectionView({
    Key? key,
    // required this.book,
    required this.iconAction
  }) : super(key: key);

  // final BookVO? book;
  final IconData iconAction;

  @override
  Widget build(BuildContext context) {
    return
    // Visibility(
    //   visible: true,
    //   child: GestureDetector(
    //     onTap: () {},
    //     child:
        Container(
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
            // Icons.headphones,
            color: Colors.white,
            size: 18,
          ),
        );
    //   ),
    // );
  }
}
