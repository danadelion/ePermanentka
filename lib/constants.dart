import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.black26,
    fontFamily: 'Shadows',
    letterSpacing: 2.0,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kFontStyleBlack = TextStyle(
  color: Colors.black,
  fontFamily: 'Shadows',
  letterSpacing: 2,
  fontWeight: FontWeight.w800,
);
const kFontStyleBlack15 = TextStyle(
  fontFamily: 'Shadows',
  fontSize: 15.0,
  color: Colors.black87,
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
);

const kFontStyleBlackSize20 = TextStyle(
  fontFamily: 'Shadows',
  fontSize: 20.0,
  letterSpacing: 3.0,
  fontWeight: FontWeight.w700,
);

const kFontStyleBlackSize30 = TextStyle(
  fontFamily: 'Shadows',
  fontSize: 30.0,
  letterSpacing: 3.0,
  fontWeight: FontWeight.w700,
);

const kFontStyleWhite = TextStyle(
  fontFamily: 'Shadows',
  color: Colors.white,
  letterSpacing: 3.0,
  fontWeight: FontWeight.w700,
);

const kFontStyleWhiteSize20 = TextStyle(
  fontFamily: 'Shadows',
  color: Colors.white,
  fontSize: 20.0,
  letterSpacing: 3.0,
  fontWeight: FontWeight.w700,
);

const kFontStyleRed = TextStyle(
  color: Colors.red,
  fontFamily: 'Shadows',
  letterSpacing: 2,
);

const kFontStyle0xFFF15124 = TextStyle(
  fontFamily: 'Shadows',
  fontSize: 15.0,
  color: Color(0xFFF15124),
  fontWeight: FontWeight.bold,
  letterSpacing: 3.0,
);
