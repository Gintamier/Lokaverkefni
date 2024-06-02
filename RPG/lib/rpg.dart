import 'dart:io';

class Item {
  String name;
  String description;

  Item(this.name, this.description);
}

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

class Game {
  List<Room> rooms;
  int currentRoomIndex = 0;
  List<Item> inventory = [];

  Game(this.rooms);

  void start() {
    print('Welcome to the Spooky Mansion RPG!');
    while (true) {
      Room currentRoom = rooms[currentRoomIndex];
      print('\nYou are in: ${currentRoom.name}');
      print(currentRoom.description);

      if (currentRoom.hasTrap) {
        if (inventory.any((item) => item.name == currentRoom.requiredItem)) {
          print('You use the ${currentRoom.requiredItem} to defeat the trap!');
          currentRoom.hasTrap = false;
        } else {
          print('You fell into a trap! Game over.');
          break;
        }
      }

      if (currentRoom.isLocked) {
        print('The door to the next room is locked. Find the key.');
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
          searchRoom(currentRoom);
          break;
        case '2':
          moveToNextRoom();
          break;
        case '3':
          moveToPreviousRoom();
          break;
        case '4':
          print('Thank you for playing!');
          return;
        default:
          print('Invalid choice. Try again.');
      }
    }
  }

  void searchRoom(Room currentRoom) {
    if (currentRoom.items.isEmpty) {
      print('No items found.');
      return;
    }

    print('You found the following items:');
    for (int i = 0; i < currentRoom.items.length; i++) {
      print('${i + 1}. ${currentRoom.items[i].name}');
    }
    stdout.write('Select an item to pick up (or press Enter to skip): ');
    String? itemChoice = stdin.readLineSync();

    if (itemChoice != null && itemChoice.isNotEmpty) {
      int itemIndex = int.parse(itemChoice) - 1;

      if (itemIndex >= 0 && itemIndex < currentRoom.items.length) {
        Item item = currentRoom.items.removeAt(itemIndex);
        inventory.add(item);
        print('You picked up: ${item.name}');
      } else {
        print('Invalid choice. Try again.');
      }
    }
  }

  void moveToNextRoom() {
    if (currentRoomIndex >= rooms.length - 1) {
      print('You have reached the end of the mansion.');
      return;
    }

    Room nextRoom = rooms[currentRoomIndex + 1];
    if (nextRoom.isLocked) {
      if (inventory.any((item) => item.name == 'Key')) {
        print('You used the key to unlock the door.');
        nextRoom.isLocked = false;
        inventory.removeWhere((item) => item.name == 'Key');
        currentRoomIndex++;
      } else {
        print('The next room is locked. Find the key first.');
      }
    } else {
      currentRoomIndex++;
    }
  }

  void moveToPreviousRoom() {
    if (currentRoomIndex <= 0) {
      print('You are in the first room. Cannot move back.');
      return;
    }
    currentRoomIndex--;
  }
}

void main() {
  List<Room> rooms = [
    Room('Entrance Hall', 'A spooky entrance hall with cobwebs in the corners.', items: [Item('Key', 'A small rusty key.')]),
    Room('Living Room', 'A dark living room with old furniture.', items: [Item('Candle', 'A candle that can light up the dark.')]),
    Room('Library', 'A quiet library filled with dusty books.', isLocked: true),
    Room('Dungeon', 'A creepy dungeon with a trap.', hasTrap: true, requiredItem: 'Candle'),
  ];

  Game game = Game(rooms);
  game.start();
}
