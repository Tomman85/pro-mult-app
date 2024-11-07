import 'package:pro_recruit_app/core/models/text_element.dart';

class CustomText {
  CustomText({
    required this.lineNumber,
    required this.listOfText,
  });

  final int lineNumber;
  final List<TextElement> listOfText;
}