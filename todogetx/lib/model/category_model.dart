// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

class CategoryModel {
  String id;
  String name;
  int countTask;
  bool hidden;
  int order;
  bool protect;
  int idColor;
  CategoryModel({
    String? id,
    required this.name,
    this.countTask = 0,
    this.hidden = false,
    this.order = 0,
    this.protect = false,
    this.idColor = 4,
  }) : id = id ?? const Uuid().v1();
}
