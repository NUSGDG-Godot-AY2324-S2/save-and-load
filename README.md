# save-and-load

Template project to practice saving player's data and load.

## Guide

This a top down game, where basic player movement and shooting has been implemented. Enemies are static.

### Scenes

1. Player

Player basic 8-directional movement. Shoot by pressing left mouse button towards the direction of the mouse.

Assets are found in `/assets/NinjaAdventure/Actor/Characters/BlueSamurai`.

2. Map

Basic layout.

Assets are found in `/assets/NinjaAdventure/Backgrounds/Tilesets`.

3. Enemy

Static enemies that the player can shoot at to take down.

Assets are found in `/assets/NinjaAdventure/Actor/Boss/GiantFlam`.

4. Bullet

This is used by player.

Assets are found in `/assets/NinjaAdventure/FX/Projectile`.

### Collision

#### Layers

* Player: 1
* Map: 2
* Enemies: 3

#### Masks

* Player: 2, 3
* Map: no mask
* Enemy: no mask
* Bullet: 2, 3

## Acknowledgements

Assets are obtained from [Ninja Adventure](https://pixel-boy.itch.io/ninja-adventure-asset-pack).
