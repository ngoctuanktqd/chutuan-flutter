import 'package:get/get.dart';

//class AppStore extends GetxController with StateMixin {}
class AppStore extends GetxController {
  static AppStore get to => Get.find();
  // Setup ngon ngu
  final _languageId = 2.obs;
  final _languageName = ''.obs;
  int get languageId => _languageId.value;
  String get languageName => _languageName.value;
  // Setup tien te
  final _currencyCode = 'USD'.obs;
  final _currencyName = 'United States Dollar'.obs;
  final _currencyCountry = 'United States'.obs;
  final _currencyCountryCode = 'US'.obs;
  final _currencyFlag =
      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAALESURBVHja7Jc/aBNxFMc/l0STtqYtihgkYLOYitjuFuwiUgfBUOgSOqS6CNqmRRqLmyjBBDQ4FLRL/TOokEEhgyC4O7RSB0MHWxEtWLGtrW2Su/s9h8ZeUlF7rV4XHzy+995v+d77vnf3fpqIsJ3mYpvtPwENcAPeMjppJlD0APXHj9/44nZvrhh3d45tsvYuAk9GdwM0nTiRkZmZb3L9+jPbuBUDmjyA1zAUIyMviMXaSaVzDPSfJJ3O0V+JqRz9A1acSufQgC+XrlpvJRXCVua06nNXYz36m0kArwtAKUVPTzvJ5FPifR0kk0/pW4/x6jje10GhoEOhaHmx7OtzP50XQDfWOIbb2lISjz+SqakFicVGN4yx2OhWJQh7AAzDJB7vYHDwEclkF4nExnBo6DGz3Rfs959/F8aHGQDKBBSJxEOuXeuit/cemUz3hhBA6d82NfxSKlkStLZekcnJeTl2LC35/Jwt/CsS6LpJT88d7oycJRod5sH9c0Sjw9z/A4Lw8egp0MptLmI9V8br8prPB8WCJYGuK27fPkPk9E2y2T5ORzJks71EIqtxZC2uznd23kJ8y9Vj9zv7MZKGjlROQSg0JKHQZZmYmJVgMLFhDAYTW5YAIBwMJmR8/JPU1Z2XsTF7OL3nkH0PtMj7g20ChDUgHAhczC8tlTAM03ZD52ue258CjwfNX8eBty+bNSBsmmbe5XL2z6yUwu12N3sApve34jFMpKQ7swPs3IGxw2NNgTINRARRpv1tQtbFld3+q3VT3CjTsAgE34/j8/kclWBlZQVqa1cJTO89TI3XiyyvOCNBbQ3LpaK1E5pKVX/B/jkDDaWkQoKPr2hoaHBUgoWFBWhsXCXwLtBCY73fUQJzXxfXKmDqfpPPMu8oAfEDBUwN2AccAfY6vJbPAq+18p3AX0YnrQgsav8vp9tN4PsALYQJa7MTgzkAAAAASUVORK5CYII='
          .obs;
  String get currencyCode => _currencyCode.value;
  String get currencyName => _currencyName.value;
  String get currencyCountry => _currencyCountry.value;
  String get currencyCountryCode => _currencyCountryCode.value;
  String get currencyFlag => _currencyFlag.value;
  // chay lenh
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  // Cap nhat du lieu
  updateCurrentLanguage(item) {
    _languageId.value = item.id;
    _languageName.value = item.name;
  }

  updateCurrentCurrency(item) {
    _currencyCode.value = item.code;
    _currencyName.value = item.name;
    _currencyCountry.value = item.country;
    _currencyCountryCode.value = item.countryCode;
    _currencyFlag.value = item.flag;
  }
}
