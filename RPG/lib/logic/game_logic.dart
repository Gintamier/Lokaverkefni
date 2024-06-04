import 'dart:io';
import 'package:rpg/models/room.dart';
import 'package:rpg/models/item.dart';

void searchRoom(Room currentRoom, List<Item> inventory) {
  print('\nSearching the room...');
  if (currentRoom.items.isEmpty) {
    print('\nNo items found.');
    return;
  }

  print('\nYou found the following items:');
  for (int i = 0; i < currentRoom.items.length; i++) {
    print('${i + 1}. ${currentRoom.items[i].name}');
  }
  stdout.write('\nSelect an item to pick up (or press Enter to skip): ');
  String? itemChoice = stdin.readLineSync();

  if (itemChoice != null && itemChoice.isNotEmpty) {
    int itemIndex = int.parse(itemChoice) - 1;

    if (itemIndex >= 0 && itemIndex < currentRoom.items.length) {
      Item item = currentRoom.items.removeAt(itemIndex);
      inventory.add(item);
      print('\nYou picked up: ${item.name}');
    } else {
      print('\nInvalid choice. Try again.');
    }
  }
}

bool moveToNextRoom(List<Room> rooms, List<Item> inventory, int currentRoomIndex) {
  if (currentRoomIndex >= rooms.length - 1) {
    print('\nYou have reached the end of the mansion.');
    return false;
  }

  Room nextRoom = rooms[currentRoomIndex + 1];
  if (nextRoom.isLocked) {
    if (inventory.any((item) => item.name == nextRoom.requiredItem)) {
      print('\nYou used the ${nextRoom.requiredItem} to unlock the door.');
      inventory.removeWhere((item) => item.name == nextRoom.requiredItem);
      nextRoom.isLocked = false;
      return true;
    } else {
      print('\nThe next room is locked. Find the ${nextRoom.requiredItem} first.');
      return false;
    }
  } else {
    return true;
  }
}

bool moveToPreviousRoom(int currentRoomIndex) {
  if (currentRoomIndex <= 0) {
    print('\nYou are in the first room. Cannot move back.');
    return false;
  }
  return true;
}
