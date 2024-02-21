import 'package:flutter/material.dart';

class MovieColor {
  static const primary_500 = Color(0xffE21221);
  static const dark_1 = Color(0xff181A20);
  static const dark_2 = Color(0xff1F222A);
  static const dark_3 = Color(0xff35383F);
  static const grey_500 = Color(0xff9E9E9E);
  static const grey_800 = Color(0xff424242);

  static const gradientRed = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffE21221),
      Color(0xffE21221),
    ],
  );
  static const gradientDart = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff35383F),
      Color(0xff35383F),
    ],
  );
}

class MovieImage {
  static const String posterPath = 'https://image.tmdb.org/t/p/original';
  static const String profilePath =
      'https://media.themoviedb.org/t/p/w276_and_h350_face/';
  static const String avatar =
      'https://firebasestorage.googleapis.com/v0/b/myphim-3daf3.appspot.com/o/default%2Favatar.png?alt=media&token=3ac7c4de-440d-498f-8507-c7f3a0dcfd4b';
}

class MovieToken {
  static const String tokenThemovieDB =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Nzk4NzVlZGJmY2NkMDFkYTJmY2ZiMGFmMDU5YTkzYiIsInN1YiI6IjY1NjczZWMwZDk1NDIwMDBjNDFmY2IwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NEfZbWNtje6eBhGMORIUsn-HJ4bGJWvogvNTReLbF38';
}

enum InputType { email, password, name, phone, readonly }

enum NotiType {
  general,
  newArrial,
  newServiceAvailable,
  newReleaseMovie,
  appUpdates,
  subscription
}
