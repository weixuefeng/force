import 'package:objectbox/objectbox.dart';

@Entity()
class StoredKeyInfo {
  // Each "Entity" needs a unique integer ID property.
  // Add `@Id()` annotation if its name isn't "id" (case insensitive).
  int id = 0;

  String? text;

  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime date;

  // An empty default constructor is needed but you can use optional args.
  StoredKeyInfo({this.text, DateTime? date}) : date = date ?? DateTime.now();

  // Note: just for logs in the examples below(), not needed by ObjectBox.
  @override
  toString() => 'StoredKeyInfo{id: $id, text: $text}';
}

@Entity()
class StoredWalletInfo {
  int id = 0;
  int parentId = -1;
  int coinType = 0;
  String? showAddress;
  String? originAddress;
  String? balance;
  bool isContract = false;
  String? contractAddress;
}
