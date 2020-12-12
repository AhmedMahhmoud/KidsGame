import 'package:flutter/cupertino.dart';

class LettersWidget extends StatelessWidget {
  final String letterName;

  final String imagePicture;

  const LettersWidget({
    this.letterName,
    this.imagePicture,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          imagePicture,
          height: 80,
          width: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
