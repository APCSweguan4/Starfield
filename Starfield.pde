Particle[] parts = new Particle[700];
boolean spacePressed = false;
void setup()
{
  smooth();
  size(700, 700);
  for(int i = 0; i < parts.length; i++){
    parts[i] = new Particle();
  }
  for(int i = 0; i < 5; i++){
    parts[i] = new OddballParticle();  
  }
  background(0);
}
void draw()
{
  if (spacePressed == false) {
    background(0);  
  }
  for(int i = 0; i < parts.length; i++) {
    parts[i].move();
    parts[i].show();  
    if(parts[i].returning) {
      parts[i].shrink();
    } else {
      parts[i].enlarge();
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    spacePressed = true;  
  }
}

void keyReleased() {
  if (key == ' ' && spacePressed == true) {
    spacePressed = false;
  }
}

class Particle
{
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
  boolean returning = false;
  Particle() {
    myColor = color(255, 255, 255, 50);
    mySize = 20.0;
    myX = myY = 350.0;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10 + 10;
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if(myX > 3000 || myX < -2050 || myY > 3000 || myY < -2050) {
      mySpeed = -mySpeed;
      returning = true;
    }
    if (dist((float)myX, (float)myY, 350, 350) < 10) {
      mySpeed = Math.random() * 10 + 10;
      returning = false;
    }
  }
  void show(){
    stroke(255, 255, 255);
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void enlarge(){
    mySize += 2.5;  
  }
  void shrink() {
    mySize -= 2.5;  
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myColor = color(110, 110, 110, 200);
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myX += Math.random() * 7 - 3;
    myY += Math.sin(myAngle) * mySpeed;
    myY += Math.random() * 7 - 3;
    if(myX > 750 || myX < -50 || myY > 750 || myY < -50) {
      myX = myY = 350.0;
      mySize = 20;
      mySpeed = Math.random() * 5 + 1;
    }
  }
  void show() {
    if (spacePressed == false) {
      stroke(0, 0, 0);
      fill(myColor);
      rect((float)myX, (float)myY, (float)mySize / 2, (float)mySize / 2);
    }
  }
}
