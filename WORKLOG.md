# Work Log

## Daniel Wu

### 5/23/24

- Started making the classes and instance variables
- Note that UML drawing needs to be transferred from smartDraw to draw.io
- Background will be set as the canonical Pac-Man map

### 5/28/24

- Started working on getting ghosts to appear on screen
- Setting instance variables for movement states
- Making methods to apply movement
- Finalized Ghost Constructor

### 5/29/24
- Did the basis of Ghost movement, can now move within the screen
- Beginning to incorporate the other ghosts into the map, will code movement soon


### 5/30/24
- Watched a video on the states of the Ghosts
- Starting to incorporate scatterState


### date 6/2/24
- Finished chase and scatter states for ghosts
- Updated many instance variables in ghost class
- Added decision-making process for the ghosts
- Worked on Game class to run the game

### 6/3/34
- Fixed ghost movement and applyDirection
- Made a changeState to swap states for ghosts in levels
- Ghosts start in scatter state

### 6/5/24
- Set Ghost first target to be outside the box
- Discussed plans with Christophe for GridSpace map

### 6/9/24  
- Added target for ghosts to move out of the box first
- Fixed timer for ghost states
- Fixed chooseDirection process
- Fixed all ScatterState for Ghosts
- Added chase and eaten states
- Added sounds for the game
- Made super pellets work
- Implemented switch states in program
- Added animations for all ghost states and whatnot
- Added reset for the game when Pac Man dies
- Resets game when Pac Man wins
- Made ghosts go back to spawn when eaten


## Christophe Casino

### 5/24/24

- Created Pac-Man class with instant variables, constructor, and basic methods
- Started to update UML but can't fully finish it as the Pac-Man class needed to be chaned along the way

### 5/28/24

- Updated Pac-Man class to better implement the functions that we want Pac-Man to accomplish
- Added a Keyboard class to implement the movement functionality of Pac-Man
- Updated the Main class to have the correct size, display a circle(for now) to represent Pac-Man, implement the movement directions of Pac-Man and have rectangles show that they are working properly

### 5/29/24

- Pulled other branches and merged the branch because it had working functions that needed to be in main
- Now changing movement to PVectors

### 5/30/24

- Added Pac-Man images to repository
- Started translating Pac-Man movement to PVectors

### 5/31/24
- Added Map image
- Moved a lot of the map properties from the main class to the map class
- Reimplemented the map properties into the main class by adding an instance of the map into the main class

### 6/4/24
- Tried to fix collisions between ghosts, Pac-Man, and the walls
- Attempted to switch the Pac-Man movement into PVectors while keeping it constantly moving

### 6/6/24
- Added collisions between Pac-Man and walls, however it is not fully done
- Fixed PVector movement of Pac-Man fully and made his movement constant

### 6/8/24
- Added collisions between Pac-Man and ghosts
- Added pellets to map and score to keep track

### 6/9/24
- Added start screen and end screen
- Added life counter to game
- Added rotation capabilty for Pac-Man
- Added animation for Pac-Man opening and closing his mouth
- Added sound bits to game
- Added ready screen
- Added reset functionality for when Pac-Man collects all the pellets
