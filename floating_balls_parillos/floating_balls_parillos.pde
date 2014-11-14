int BallCount = 100;

float[] x = new float [BallCount];
float[] y =  new float [BallCount];
float[] sz =  new float [BallCount];
float[] xspeed = new float [BallCount];
float[] yspeed =  new float [BallCount];
color[] colors = new color [BallCount];

void setup () {
  colorMode (HSB, 360, 100, 100, 100);
  size (800, 600);
  for (int i = 0; i<BallCount; i++) {
    sz[i] = random(5, 80); 
    x[i] = random(sz[i]/2, width -sz[i]/2); 
    y[i] = random(sz[i]/2, width -sz[i]/2); 

    xspeed[i] = random (-5, 5); 
    yspeed[i] = random (-5, 5); 
    colors[i] = color(random(360), random(80, 100), random(80, 100), 50);
  }
}



void draw() {
  background(0);


  for (int i = 0; i < BallCount; i++) {
    fill(colors[i]);


    ellipse(x[i], y[i], sz[i], sz[i]);
    x[i]+=xspeed[i];
    y[i]+=yspeed[i];

    if (x[i]+sz[i]/2 >= width || x[i]-sz[i]/2 <= 0) {
      xspeed[i] *= -1;
    }

    if (y[i]+sz[i]/2 >= height || y[i]-sz[i]/2 <= 0) {
      yspeed[i] *= -1;
    }
  }
}

