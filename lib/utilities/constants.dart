import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);


const kHintTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
);

const kInputTextDeco = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a city name',
  icon: Icon(
      Icons.location_city,
      color: Colors.white),
  hintStyle: kHintTextStyle,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0)),
    borderSide: BorderSide.none,
  )
);


