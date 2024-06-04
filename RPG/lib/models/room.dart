import 'item.dart';

class Room {
  String name;
  String description;
  List<Item> items;
  bool isLocked;
  bool hasTrap;
  String requiredItem;

  Room(this.name, this.description,
      {this.items = const [], this.isLocked = false, this.hasTrap = false, this.requiredItem = ''});
}
