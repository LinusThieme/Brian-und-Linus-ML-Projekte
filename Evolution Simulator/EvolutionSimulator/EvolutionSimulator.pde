

public World World;
public FirstPersonPlayer player;

void setup() {
  
  //initialize window
  size(1280, 720, P3D);
  //set drawing modes
  rectMode(CENTER);
  
  //Create a new World
  World = new World();
  player = new FirstPersonPlayer(new PVector(64.5, 10, 64.5));
  
  
}

void draw() {
  
  background(150,150,255);
  player.Draw();
  World.Draw();
  
}
