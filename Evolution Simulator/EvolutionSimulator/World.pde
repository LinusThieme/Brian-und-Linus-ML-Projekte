

class World{
  
  //Constants
  private final int WIDTH = 128;
  private final int HEIGHT = 128;
  private final double minimalFoodValueForReproduction = 50;
  private final float changeRange = 1;
  
  //Experimental
  private PShape model = createShape();
  
  //Creatures Array
  private ArrayList<Creature> Creatures = new ArrayList<Creature>();
  
  //Tiles
  private Tile[][] Tiles = new Tile[HEIGHT][WIDTH];
  
  
  //Constructor
  public World(){
    
    //Generate Tiles
    noiseDetail(3,0.5);
    model.beginShape(TRIANGLES);
    model.noStroke();
    for(int y=0; y < HEIGHT; y++){
      for(int x=0; x < WIDTH; x++){
        float h = noise(x*0.1,y*0.1);
        Tiles[y][x] = new Tile(x, y, h);
        
        ///////////////////////////////////////////////
        float h1 = noise((x-0.5)*0.1, (y-0.5)*0.1);
        float h2 = noise((x+0.5)*0.1, (y-0.5)*0.1);
        float h3 = noise((x+0.5)*0.1, (y+0.5)*0.1);
        float h4 = noise((x-0.5)*0.1, (y+0.5)*0.1);
        
        color c1 = (h1<0.45) ? color(0,0,map(h1,0,0.45,50,255)) : color(0,map(h1,0.45,1,255,50),0);
        color c2 = (h1<0.45) ? color(0,0,map(h2,0,0.45,50,255)) : color(0,map(h2,0.45,1,255,50),0);
        color c3 = (h1<0.45) ? color(0,0,map(h3,0,0.45,50,255)) : color(0,map(h3,0.45,1,255,50),0);
        color c4 = (h1<0.45) ? color(0,0,map(h4,0,0.45,50,255)) : color(0,map(h4,0.45,1,255,50),0);
        
        
        PVector v1 = new PVector(x-0.5, map(h1,0,1,-5,5), y-0.5);
        PVector v2 = new PVector(x+0.5, map(h2,0,1,-5,5), y-0.5);
        PVector v3 = new PVector(x+0.5, map(h3,0,1,-5,5), y+0.5);
        PVector v4 = new PVector(x-0.5, map(h4,0,1,-5,5), y+0.5);
        
        model.fill(c2);
        model.vertex(v2.x, v2.y, v2.z);
        model.fill(c4);
        model.vertex(v4.x,v4.y,v4.z);
        model.fill(c1);
        model.vertex(v1.x, v1.y, v1.z);
        model.fill(c2);
        model.vertex(v2.x,v2.y,v2.z);
        model.fill(c3);
        model.vertex(v3.x, v3.y, v3.z);
        model.fill(c4);
        model.vertex(v4.x,v4.y,v4.z);
        
        
        /////////////////////////////////////////////////////////////
        
      }
    }
    model.endShape();
    
  }
  
  //Add a Creature to this World
  public void AddCreature(Creature Creature){
    
    Creatures.add(Creature);
    
  }
  
  public void Draw(){
    /*
    for(int y=0; y < HEIGHT; y++){
       for(int x=0; x < WIDTH; x++){
         Tiles[y][x].Draw();
       }
    }
    */
    shape(model);
    
  }


  
}
