# Spooky Mansion RPG

Welcome to the Spooky Mansion RPG! This is a simple text-based adventure game where you explore rooms in a haunted mansion, collect items, and avoid traps.

## Project Structure

### Files and Directories

#### `main.dart`

This is the entry point of the application. It initializes the game by creating a list of rooms (the haunted mansion) and starts the game.

#### `models/`

This directory contains the data models used in the game.

- **`item.dart`**: Defines the `Item` class, which represents items that can be found in rooms and added to the player's inventory.
- **`room.dart`**: Defines the `Room` class, which represents a room in the mansion. Each room has a name, description, items, and properties like `isLocked` and `hasTrap`.

#### `game/`

This directory contains the main game logic.

- **`game.dart`**: Defines the `Game` class, which manages the game flow. It handles starting the game, player actions, and transitioning between rooms.

#### `logic/`

This directory contains additional game logic functions used by the `Game` class.

- **`game_logic.dart`**: Contains functions for searching rooms, moving to the next room, and moving to the previous room. These functions are used by the `Game` class to perform specific actions based on player choices.

## How to Play

1. **Start the game**: Run the `main.dart` file to start the game. You will be welcomed to the Spooky Mansion RPG.
2. **Explore rooms**: The game will describe your current location and provide options to search the room, move to the next room, move to the previous room, or exit the game.
3. **Collect items**: Search rooms to find items that may be useful later in the game.
4. **Avoid traps**: Some rooms have traps that require specific items to disarm. Make sure to collect necessary items to avoid falling into traps.
5. **Unlock doors**: Some rooms are locked and require specific items to unlock. Use the correct items to progress through the mansion.
6. **Reach the end**: Your goal is to reach the last room of the mansion. When you do, you will be congratulated for completing the game.
