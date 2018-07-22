

class Tile{
  
  //Tile information
  private int x;
  private int y;
  private float Elevation;
  
  //Information for Creatures
  private boolean IsWater;
  private float FoodValue = 100;
  
  //Constants
  private final float WaterLevel = 0.45;
  private final int maxFood = 100;
  
  //Esthetic Values
  color Color;
  
  //Computational Variables
  private final float regrowthRate = 1/600;
  private float time = 0;
  
  //Constructor
  public Tile(int x, int y, float Elevation){
    
    this.x = x;
    this.y = y;
    this.Elevation = Elevation;
    
    if(Elevation < WaterLevel){
      
      this.Color = color(0,0,map(Elevation,0,WaterLevel,50,255));
      this.IsWater = true;
      
    } else {
      
      this.Color = color(0,map(Elevation,WaterLevel,1,255,50),0);
      this.IsWater = false;
      
    }
    
  }
  
  //Draw this Tile
  public void Draw(){
    
    pushMatrix();
    pushStyle();
    fill(Color);
    rect(80*x+40,80*y+40,80,80);
    popStyle();
    popMatrix();
    
  }
  
  public void UpdateTile(float newTime){
    float dt = newTime - time;
    FoodValue = constrain(FoodValue + dt*regrowthRate, 0, maxFood);
  }
  
  
}
