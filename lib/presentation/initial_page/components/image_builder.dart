import 'package:flutter/material.dart';
import 'package:pro_recruit_app/core/models/custom_text.dart';
import 'package:pro_recruit_app/core/models/text_element.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    required this.isPortrait,
    required this.index,
    super.key,
  });

  final bool isPortrait;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _ImageContainer(index: index, isPortrait: isPortrait),
        ],
      );
    }
    return _ImageContainer(index: index, isPortrait: isPortrait);
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    required this.index,
    required this.isPortrait,
  });

  final int index;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2,
      width: size.width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            right: isPortrait ? null : size.width / 8,
            bottom: isPortrait ? null : 0,
            top: isPortrait ? null : 0,
            child: Image.asset(
              'assets/images/$index.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: isPortrait
                ? -(30 * allTexts[index].lineNumber).toDouble()
                : null,
            left: isPortrait ? null : 0,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: staticStyle,
                children: List.generate(
                  allTexts[index].listOfText.length,
                  (innerIndex) {
                    final item = allTexts[index].listOfText[innerIndex];
                    return TextSpan(
                      text: item.text,
                      style: staticStyle.copyWith(
                        height: 1.1,
                        fontWeight:
                            item.isBold ? FontWeight.w800 : FontWeight.w300,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const staticStyle = TextStyle(
  fontFamily: 'Heebo',
  color: Colors.white,
  fontSize: 28,
);

final allTexts = <CustomText>[
  CustomText(
    lineNumber: 2,
    listOfText: [
      TextElement(
        text: 'Spędzaj czas\n',
        isBold: false,
      ),
      TextElement(
        text: 'kreatywnie!',
        isBold: true,
      ),
    ],
  ),
  CustomText(
    lineNumber: 2,
    listOfText: [
      TextElement(
        text: 'Bierz udział\n',
        isBold: true,
      ),
      TextElement(
        text: 'w wydarzeniach!',
        isBold: false,
      ),
    ],
  ),
  CustomText(
    lineNumber: 2,
    listOfText: [
      TextElement(
        text: 'Poznawaj\n',
        isBold: false,
      ),
      TextElement(
        text: 'nieodkryte ',
        isBold: false,
      ),
      TextElement(
        text: 'szlaki!',
        isBold: true,
      ),
    ],
  ),
  CustomText(
    lineNumber: 2,
    listOfText: [
      TextElement(
        text: 'Ustawiaj\n',
        isBold: false,
      ),
      TextElement(
        text: 'przypomnienia! ',
        isBold: true,
      ),
    ],
  ),
  CustomText(
    lineNumber: 1,
    listOfText: [
      TextElement(
        text: 'Bądź',
        isBold: false,
      ),
      TextElement(
        text: ' na bieżąco! ',
        isBold: true,
      ),
    ],
  ),
  CustomText(
    lineNumber: 1,
    listOfText: [
      TextElement(
        text: 'Złap',
        isBold: false,
      ),
      TextElement(
        text: ' swoj rytm! ',
        isBold: true,
      ),
    ],
  ),
];
