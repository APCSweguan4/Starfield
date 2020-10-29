Particle[] parts = new Particle[200];
void setup()
{
  size(700, 700);
  for(int i = 0; i < parts.length; i++){
    parts[i] = new Particle();  
  }
  for(int i = 0; i < parts.length / 2; i++){
    parts[i] = new OddballParticle();
  }
}
void draw()
{
  background(55);
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
class Particle
{
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
  boolean returning = false;
  Particle() {
    myColor = color(255, 255, 255, 100);
    mySize = 20.0;
    myX = myY = 350.0;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 5 + 1;
  }
  void move(){
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if(myX > 750 || myX < -50 || myY > 750 || myY < -50) {
      mySpeed = -mySpeed;
      returning = true;
    }
    if (dist((float)myX, (float)myY, 350, 350) < 10) {
      mySpeed = Math.random() * 5 + 1; 
      returning = false;
    }
  }
  void show(){
    stroke(255, 255, 255);
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void enlarge(){
    mySize += 0.5;  
  }
  void shrink() {
    mySize -= 0.5;  
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myColor = color(0, 0, 0, 200);
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
    stroke(0, 0, 0);
    fill(myColor);
    rect((float)myX, (float)myY, (float)mySize / 2, (float)mySize / 2);
  }
}
