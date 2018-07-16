

class World{
  
  //Constants
  private final int WIDTH = 128;
  private final int HEIGHT = 128;
  private final double minimalFoodValueForReproduktion = 50;
  private final float changeRange = 1;
  
  //Creatures Array
  private ArrayList<Creature> Creatures = new ArrayList<Creature>();
  
  //Tiles
  private Tile[][] Tiles = new Tile[HEIGHT][WIDTH];
  
  
  //Constructor
  public World(){
    
    //Generate Tiles
    noiseDetail(3,0.5);
    for(int y=0; y < HEIGHT; y++){
      for(int x=0; x < WIDTH; x++){
        Tiles[y][x] = new Tile(x, y, noise(x*0.1,y*0.1));
      }
    }
    
  }
  
  //Add a Creature to this World
  public void AddCreature(Creature Creature){
    
    Creatures.add(Creature);
    
  }
  
  public void Draw(){
    
    for(int y=0; y < HEIGHT; y++){
       for(int x=0; x < WIDTH; x++){
         Tiles[y][x].Draw();
       }
    }
    
    
  }


  
}
