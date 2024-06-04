import 'package:rpg/models/item.dart';
import 'package:rpg/models/room.dart';
import 'package:rpg/game/game.dart';

void main() {
  List<Room> hauntedMansion = createHauntedMansion();

  Game game = Game(hauntedMansion);
  game.start();
}

List<Room> createHauntedMansion() {
  return [
    Room(
      'Entrance Hall',
      'A grand entrance hall with eerie portraits on the walls and cobwebs in the corners. The air is thick with dust.',
      items: [Item('Rusty Key', 'An old, rusty key that looks like it could open an ancient lock.')],
    ),
    Room(
      'Dining Room',
      'A dimly lit dining room with a long table covered in a dusty, tattered tablecloth. There are broken plates and cutlery scattered around.',
      items: [Item('Candle', 'A half-melted candle that might still be useful.')],
    ),
    Room(
      'Library',
      'A quiet library filled with ancient, dusty books. The shelves seem to go on forever.',
      isLocked: true,
      requiredItem: 'Rusty Key',
      items: [Item('Silver Key', 'A shiny silver key with intricate designs. It looks valuable.')],
    ),
    Room(
      'Study',
      'A small study room with a large desk and a flickering lamp. Papers are strewn about, and there’s a strange draft.',
      hasTrap: true,
      requiredItem: 'Candle',
    ),
    Room(
      'Ballroom',
      'An expansive ballroom with a grand chandelier hanging precariously from the ceiling. The floor is covered in debris.',
      items: [Item('Rope', 'A sturdy rope that could be useful in a variety of situations.')],
    ),
    Room(
      'Secret Passage',
      'A hidden passageway behind a bookshelf. It’s dark and narrow, with strange markings on the walls.',
      isLocked: true,
      requiredItem: 'Silver Key',
    ),
    Room(
      'Master Bedroom',
      'A large bedroom with a four-poster bed and tattered curtains. The bed looks like it hasn’t been slept in for decades.',
      items: [Item('Golden Key', 'A key made of gold. It must open something important.')],
    ),
    Room(
      'Dungeon',
      'A dark, damp dungeon with iron bars and a foul smell. There’s something lurking in the shadows.',
      hasTrap: true,
      requiredItem: 'Rope',
    ),
    Room(
      'Treasure Room',
      'A hidden room filled with treasure chests and glittering jewels. The air is thick with the scent of riches.',
      isLocked: true,
      requiredItem: 'Golden Key',
    ),
    Room(
      'Freedom',
      'A golden gate within the treasure room which leads to freedom. The air is thick with the scent of riches!',
      isLocked: true,
      requiredItem: 'Golden Key',
      items: [Item('Golden Key', 'A key made of gold. It must open something important.')]
    ),
  ];
}
