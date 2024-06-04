import 'dart:io';
import 'package:rpg/models/room.dart';
import 'package:rpg/models/item.dart';
import 'package:rpg/logic/game_logic.dart';

class Game {
  List<Room> rooms;
  int currentRoomIndex = 0;
  List<Item> inventory = [];

  Game(this.rooms);

  void start() {
    print('Welcome to the Spooky Mansion RPG!');
    while (true) {
      Room currentRoom = rooms[currentRoomIndex];
      print('----------------------------');
      print('----------------------------');
      print('----------------------------');
      print('\nYou are in: ${currentRoom.name}');
      print(currentRoom.description);

      if (currentRoom.hasTrap) {
        if (inventory.any((item) => item.name == currentRoom.requiredItem)) {
          print('\nYou use the ${currentRoom.requiredItem} to defeat the trap!');
          inventory.removeWhere((item) => item.name == currentRoom.requiredItem);
          currentRoom.hasTrap = false;
        } else {
          print('\nYou fell into a trap! Game over.');
          break;
        }
      }

      if (currentRoom.isLocked) {
        print('\nThe door to the next room is locked. Find the ${currentRoom.requiredItem}.');
      }

      print('\nInventory:');
      inventory.forEach((item) => print('- ${item.name}: ${item.description}'));

      print('\nChoose an action:');
      print('1. Search the room');
      print('2. Move to the next room');
      print('3. Move to the previous room');
      print('4. Exit game');
      stdout.write('> ');
      String choice = stdin.readLineSync()!;

      switch (choice) {
        case '1':
          searchRoom(currentRoom, inventory);
          break;
        case '2':
          if (moveToNextRoom(rooms, inventory, currentRoomIndex)) {
            currentRoomIndex++;
            if (currentRoomIndex == rooms.length - 1) {
              print('\nYou are in: ${rooms[currentRoomIndex].name}');
              print(rooms[currentRoomIndex].description);
              print('\nCongratulations! You have reached the end of the mansion.');
              return;
            }
          }
          break;
        case '3':
          if (moveToPreviousRoom(currentRoomIndex)) {
            currentRoomIndex--;
          }
          break;
        case '4':
          print('\nThank you for playing!');
          return;
        default:
          print('\nInvalid choice. Try again.');
      }
    }
  }
}
