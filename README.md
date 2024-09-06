# Tic Tac Toe Game

This is a command-line Tic Tac Toe game implemented in Ruby. The game allows two players to compete against each other by taking turns to place their chosen character (X or O) on a 3x3 grid. The objective is to be the first player to align three of their characters either horizontally, vertically, or diagonally.

## Features

- Two-player game: Players can choose their characters and take turns.
- Real-time board display: The board updates after each turn.
- Win detection: The game automatically checks for a winning condition after each move.
- Draw detection: The game will detect if the board is full and declare a draw.
- Colorized output: Winning moves are highlighted in green, and in case of a draw, the board is highlighted in red.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Sandotech/tic-tac-toe
   ```
2. Navigate to the project directory:
   ```bash
   cd tic-tac-toe
   ```

## Usage

To start the game, run the `main.rb` file:

```bash
ruby main.rb
```

## How to Play

1. Player 1 is prompted to enter their character (X or O).
2. Player 2 is then prompted to enter their character.
3. Players take turns to choose the row and column where they want to place their character.
4. The game continues until one player wins by aligning three characters in a row, column, or diagonal, or the game ends in a draw if the board is full.

## Code Structure

- **lib/board.rb**: Contains the `Board` class, which manages the game board, including displaying it, setting moves, and checking for a win or draw.
- **lib/player.rb**: Contains the `Player` class, which handles player initialization and character validation.
- **lib/game.rb**: Contains the `Game` class, which manages the flow of the game, including player turns, checking for a win, and displaying the board.
- **main.rb**: The entry point for the game, which initializes the game and starts the gameplay loop.

## Dependencies

This game uses the `colorize` gem to add color to the terminal output. If you don't have it installed, you can add it by running:

```bash
gem install colorize
```

or

```bash
bundle init
bundle install colorize
```

## License

This project is licensed under the MIT License.

## Contributing

Feel free to submit issues and pull requests if you find any bugs or want to improve the game.

## Contact

If you have any questions or suggestions, feel free to reach out to me at dseosantos76@gmai.com.
