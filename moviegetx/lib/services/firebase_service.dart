import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviegetx/models/users_model.dart';

class FirebaseService {
  userRef() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        );
  }

  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  //

  // late final SharedPreferences _prefs;

  // Future<SharedService> init() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return this;
  // }

  // Future<void> setString(String key, Object value) async {
  //   // print(jsonEncode(value));
  //   await _prefs.setString(key, jsonEncode(value));
  // }

  // String getString(String key) {
  //   String value = _prefs.getString(key) ?? '';
  //   return value;
  // }

  // void clear(String key) async {
  //   await _prefs.remove(key);
  // }
}
