PVector loc;  
PVector vel;  
PVector acc; 

int sz = 50;

boolean keys[] = new boolean[255];

void setup() {
  
  background(0);
  
  colorMode(HSB, 360, 100, 100, 100);
  size(displayWidth, displayHeight);

  loc = new PVector(width/2, height/2);

  vel = new PVector(0, 0);

  acc = new PVector(0, 0);
}

void draw() {
  
  updatePlayers();

  fill(frameCount%360, 100, 100, 100);
  stroke(frameCount%360, 100, 100, 100);

  vel.add(acc);

  vel.limit(5);

  loc.add(vel);

  ellipse(loc.x, loc.y, sz, sz);

  if (loc.x - sz/2 > width) {      
    loc.x = -sz/2;
  }

  if (loc.x + sz/2 < 0) {          
    loc.x = width + sz/2;
  }

  if (loc.y - sz/2 > height) {    
    loc.y = -sz/2;
  }

  if (loc.y + sz/2 < 0) {         
    loc.y = height + sz/2;
  }
}

void keyPressed() {
  if (key==CODED) {
    keys[keyCode] = true;
  } else if (key!=CODED) {
    keys[key] = true;
  }
}

void keyReleased() {
  if (key==CODED) {
    keys[keyCode] = false;
  } else if (key!=CODED) {
    keys[key] = false;
  }
}

void updatePlayers(){
  
   if (keys['w']) {
    acc.y=-0.05;
  }
  if (keys['s']) {
    acc.y=0.05;
  }
  if (keys['a']) {
    acc.x=-0.05;
  }
  if (keys['d']) {
    acc.x=0.05;
  }
  
}

