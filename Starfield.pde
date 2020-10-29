Particle[] parts = new Particle[200];
void setup()
{
  size(700, 700);
  for(int i = 0; i < parts.length; i++){
    parts[i] = new OddballParticle();  
  }
  for(int i = 0; i < parts.length / 2; i++){
    parts[i] = new Particle();
  }
}
void draw()
{
  background(55);
  for(int i = 0; i < parts.length; i++) {
    parts[i].move();
    parts[i].show();  
    parts[i].enlarge();
  }
}
class Particle
{
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
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
      myX = myY = 350.0;
      mySize = 20;
      mySpeed = Math.random() * 5 + 1;
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
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myColor = color(0, 0, 0, 100);
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
