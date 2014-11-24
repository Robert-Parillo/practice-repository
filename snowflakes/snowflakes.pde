int count = 500;
float [] xPosition = new float[count];
float [] yPosition = new float[count];
int [] flakeSize = new int[count];
int [] direction = new int[count];
float [] flakecolor = new float[count];
int minFlakeSize = 5;
int maxFlakeSize = 15;

void setup() {
  
  size(displayWidth, displayHeight);
  frameRate(30);
  noStroke();
  smooth();
  
  for(int i = 0; i < count; i++) {
    flakecolor[i] = random(50,255);
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

void draw() {
  
  background(0);
  
  for(int i = 0; i < xPosition.length; i++) {
    fill(flakecolor[i]);
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
    
  }
  
}
