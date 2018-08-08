

class FirstPersonPlayer {
  
  
  private final PVector direction = new PVector(1,0,0);
  private PVector view = new PVector(0, 0, 0);
  private PVector position;
  
  FirstPersonPlayer(PVector position){
    this.position = position;
  }
  
  public void Draw() {
    
    //Z
    direction.x = cos(view.z);
    direction.y = sin(view.z);
    
    //Y
    float nX = cos(view.y)*direction.x;
    direction.z = -direction.x * sin(view.y);
    direction.x = nX;
    
    
    Update();
    perspective(1.5707, width/height, 0.1, 200);
    
    PVector looking = new PVector();
    looking = position.copy();
    looking.add(direction.normalize());
    camera(position.x,position.y,position.z, looking.x, looking.y, looking.z, 0, -1, 0);
  }
  private void Update() {
    
    
    //Walk
    if(keyPressed){
      
       switch(key){
         
          case 'w':
          position.add(direction);
          break;
          
          case 's':
          position.sub(direction);
          break;
          
          case 'a':
          PVector temp = new PVector(direction.z, direction.y, -direction.x);
          position.sub(temp);
          break;
          
          case 'd':
          PVector temp2 = new PVector(direction.z, direction.y, -direction.x);
          position.add(temp2);
          break;
          
          default:
       }
       
       switch(keyCode){
         
          case UP:
          view.z += 0.05;
          view.z = constrain(view.z, -1.5707, 1.5707);
          break;
          
          case DOWN:
          view.z -= 0.05;
          view.z = constrain(view.z, -1.5707, 1.5707);
          break;
          
          case LEFT:
          view.y -= 0.05;
          break;
          
          case RIGHT:
          view.y += 0.05;
          break;
          
          case SHIFT:
            position.y += 1;
            break;
          
          case CONTROL:
            position.y -= 1;
            break;
          
          default:
       }
       
      
       
    }
    //
    
  }








}
