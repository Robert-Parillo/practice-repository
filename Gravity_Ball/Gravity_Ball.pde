


float x1 = 0;   
float y1 = height; 
float sz = 30;

float xspeed = 15; 
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
  ellipse(x1,y1,sz,sz);
  ellipse(x1+50,y1,sz,sz);
  
 
  
  x1 = x1 + xspeed;
  y1 = y1 + yspeed;
  
  
  yspeed = yspeed + gravity;
  
 
  if (y1+sz/2 >= height) {
    y1=height-sz/2;
    yspeed = yspeed * -0.70;
    
  }
  
  
  
  if (x1+sz/2 >= width || x1-sz/2 <= 0) {
     ellipse(x1,y1,sz,sz);
    xspeed = xspeed * -0.80; 
    
  }
    
 
}
