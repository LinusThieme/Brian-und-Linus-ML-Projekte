

public World World;

void setup() {
  
  //initialize window
  size(1280, 720);
  //set drawing modes
  rectMode(CENTER);
  
  //Create a new World
  World = new World();
}

void draw() {
  
  scale(0.07);
  World.Draw();
  
}
