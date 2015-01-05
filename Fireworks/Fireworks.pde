import ddf.minim.spi.*;  //All this is required to help the audio play
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import ddf.minim.*;

AudioPlayer player;
Minim minim;


Firework[] fs = new Firework[150]; //Limit of 150 fireworks
boolean once;

PImage Castle;   // Declares Castle

void setup() {
  size(displayWidth,displayHeight, P3D);
  
   minim = new Minim(this);   
   
   player = minim.loadFile("Letitgo.mp3");  //Loads audio to play
   
   player.play();  //Plays audio
   
   smooth();
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Firework();
  }
  
 
  Castle = loadImage("discas.png");   //Loads Castle
  
   
}

void mouseReleased(){  //Tells Computer to shoot Firework once mouse is released
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
  
   for (int i = 0; i < fs.length; i++){   //Shoots firework
    fs[i].draw();
  }
  
  image(Castle, 0, 0);  //Puts the Castle in the screen
}
