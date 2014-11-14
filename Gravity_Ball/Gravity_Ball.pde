

float x = 100;   
float y = 0; 
float sz = 30;

float xspeed = 5; 
float yspeed = 0; 

float gravity = 0.1;  

void setup() {
  size(displayWidth,displayHeight);
 
}

void draw() {
  background(0);

  
  fill(#FF00F3,100);
  stroke(0);
  rectMode(CENTER);
  ellipse(x,y,sz,sz);
  
 
  
  x = x + xspeed;
  y = y + yspeed;
  
  
  yspeed = yspeed + gravity;
  
 
  if (y+sz/2 >= height) {
    y=height-sz/2;
    yspeed = yspeed * -0.95;
    
  }
  
   if (x+sz/2 >= width || x-sz/2 <= 0) {
     ellipse(x,y,sz,sz);
    xspeed = xspeed * -1; 
  }
    
 
}
