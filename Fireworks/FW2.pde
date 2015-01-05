class Firework{ //Fireworks Class
  float x, y, oldX,oldY, ySpeed, targetX, targetY, explodeTimer, flareWeight, flareAngle; //Variables for Firework
  int flareAmount, duration;
  boolean launched,exploded,hidden;  //booleans to shoot explode and make the fire works disappear 
  color flare;
  Firework(){
    launched = false;   
    exploded = false;
    hidden = true;
  }
  void draw(){
    if((launched)&&(!exploded)&&(!hidden)){  //Shoots the initial firework or the rocket
      launchMaths();
      strokeWeight(1);
      stroke(255);
      line(x,y,oldX,oldY);
    }
    if((!launched)&&(exploded)&&(!hidden)){  //Makes the Firework explode
      explodeMaths();
      noStroke();
      strokeWeight(flareWeight);
      stroke(flare);
      for(int i = 0; i < flareAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*flareAngle))*explodeTimer,cos(radians(i*flareAngle))*explodeTimer);
          popMatrix();
       }
    }
    if((!launched)&&(!exploded)&&(hidden)){  //Makes the Firework disappear
      
    }
  }
  void launch(){    //everything needed to launch the firework
    x = oldX = mouseX + ((random(5)*10) - 25);
    y = oldY = height;
    targetX = mouseX;
    targetY = mouseY;
    ySpeed = random(3) + 8;
    flare = color(random(3)*50 + 105,random(3)*50 + 105,random(3)*50 + 105);
    flareAmount = ceil(random(30)) + 50;
    flareWeight = ceil(random(3));
    duration = ceil(random(4))*20 + 5;
    flareAngle = 360/flareAmount;
    launched = true;
    exploded = false;
    hidden = false;
  }
  void launchMaths(){   //All the math behind the launch code
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 10){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
  }
  void explode(){  //All variables needed to explode the Firework
    explodeTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  void explodeMaths(){  //Math behind the explosion
    if(explodeTimer < duration){
      explodeTimer+= 1;
    }else{
      hide();
    }
  }
  void hide(){   //All variables used for making the Firework disappear
    launched = false;
    exploded = false;
    hidden = true;
  }
}

