class Creature{
  
  double x,y;
  
  private World World;
  
  Creature(double x, double y, World World){
  
    this.x = x;
    this.y = y;
    
    this.World = World;
    World.AddCreature(this);

  }
  
  
}
