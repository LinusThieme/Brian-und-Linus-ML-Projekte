import com.jogamp.opengl.GL;
import com.jogamp.opengl.GL2ES2;
 
PJOGL pgl;
GL2ES2 gl;

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
  pgl = (PJOGL) beginPGL();  
  gl = pgl.gl.getGL2ES2();
  gl.glEnable(GL.GL_CULL_FACE);
  gl.glCullFace(GL.GL_BACK);
  
  player.Draw();
  World.Draw();
  
}
