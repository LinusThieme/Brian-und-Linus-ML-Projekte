

class Creature{
  
  double x,y;
  double bodyRadius;
  double age;
  double food;
  
  
  private World world;
  
  Creature(double x, double y, World world,double bodyRadius,double age, double food){
  
    this.x          = x;
    this.y          = y;
    this.bodyRadius = bodyRadius;
    this.age        = age;
    this.food       = food;
    
    this.world = world;
    world.AddCreature(this);

  }
  
  public Creature(){}
  
  
  public void reproduce(){
    
    //Wenn es reicht um sich zu vermehren
    if(food >= world.minimalFoodValueForReproduction){
      
      double babyBodyRadius = bodyRadius + map((float)random(0,1),0,1,-1 *world.changeRange,world.changeRange);
      Creature baby = new Creature(x,y,world,babyBodyRadius,0,world.minimalFoodValueForReproduction);
      
      food -= world.minimalFoodValueForReproduction;
      
      
    }
    
    
  }
  
  
}
