
PVector loc, vel, acc;
int sz = 70;

void setup() {
  size(800, 600);
 
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();   
  acc = new PVector(0, 0);
  noCursor();
}

void draw() {
  background(0);
 
  vel.add(acc);
  loc.add(vel);

 
  if (dist(mouseX, mouseY, loc.x, loc.y) < sz/2) {  
    fill(#FEFF03);                                
  } else {                                           
    fill(0, 0, 255);                               
  }


  ellipse(loc.x, loc.y, sz, sz);

 
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }

 
  ellipse(mouseX, mouseY, 5, 5);
}
