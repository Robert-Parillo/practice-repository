import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import ddf.minim.*;

AudioPlayer player;
Minim minim;


Firework[] fs = new Firework[150];
boolean once;

PImage Castle;

void setup() {
  size(displayWidth,displayHeight, P3D);
  
   minim = new Minim(this);
   
   player = minim.loadFile("Letitgo.mp3");
   
   player.play();
   
   smooth();
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Firework();
  }
  
 
  Castle = loadImage("discas.png");
  
   
}

void mouseReleased(){
  once = false;
  for (int i = 0; i < fs.length; i++){
    if((fs[i].hidden)&&(!once)){
      fs[i].launch();
      once = true;
    }
  }
}


void draw() {
  background(0);
  
   for (int i = 0; i < fs.length; i++){
    fs[i].draw();
  }
  
  fill(0,0,0);
  rect(0,height+50,width,height);
  
  image(Castle, 0, 0);
}
