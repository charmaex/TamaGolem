# TamaGolem
Tamagotchi like game with a golem!

Similar to MiniRPG I didn't spend much time to create this game.
It has a very simple game logic. The character needs love or food and you feed him by dragging the corresponding symbol onto him.
Right now you can choose between two characters but more characters can be added easily. (Actually there is a third character - the miner - whose graphics need to be adjusted to make it fully work)
You can pick the character at startup and when your pet died.
This game uses UIKit to do some animations.


###Requirements:
- Create a way to restart the game (replay button or your choice) when the Gigapet dies - he should get full health, and come back to life (find your own graphic for this button)
- Create a view that only loads when the app first starts that allows you to pick between two characters (use the attached graphical resources for that). - Whatever character picked is the one that is used in the game until the app is closed and re-opened
- Create a 3rd item that the Gigapet needs randomly - obedience - find your own graphic for this item
- Based on which character is selected change the scenery to match that character (pick your own graphics from the attached graphical resources)