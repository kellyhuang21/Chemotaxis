/* @pjs preload="minion.png"; */
/* @pjs preload="banana.png"; */
PImage minion;
PImage banana;
int x = 400;
int y = 400; 
Bacteria [] colony;
void setup()
{
  size(800, 800);
  frameRate(40);
  minion =loadImage("minion.png");
  banana =loadImage("banana.png");
  colony = new Bacteria [50];
  for (int i = 0; i<colony.length; i++) {
    colony[i] = new Bacteria(200, 200);
  }
}
void draw()
{
  background(0);
  for (int i=0; i<colony.length; i++) {
    colony[i].move();
    colony[i].show();
    if(mousePressed !=true){
    banana();
    }
  }
}

void banana() {
  {
    fill(255);
    banana.resize(45, 30);
    image(banana, mouseX, mouseY);
  }
}
  class Bacteria 
  {
    int myX, myY;
    Bacteria(int x, int y)
    {
      myX = (int)(Math.random()*400);;
      myY = (int)(Math.random()*400);;
    }
    void show()
    {
      noStroke();
      //ellipse(myX,myY,15,15);
      minion.resize(40, 40);
      image(minion, myX, myY);
    }
    void move()
    {
      int walk = 4;
      
      if (mousePressed != true) {

        if (mouseX<myX && mouseY<myY) {
          myX = myX + (int)(Math.random()*walk)-walk;
          myY = myY - (int)(Math.random()*walk)-walk;
        } else if (mouseX>myX && mouseY>myY) {
          myX = myX - (int)(Math.random()*walk)+walk;
          myY = myY - (int)(Math.random()*walk)+walk;
        } else if (mouseX<myX && mouseY>myY) {
          myX = myX + (int)(Math.random()*walk)-walk;
          myY = myY + (int)(Math.random()*walk)+walk;
        } else if (mouseX>myX && mouseY<myY) {
          myX = myX - (int)(Math.random()*walk)+walk;
          myY = myY + (int)(Math.random()*walk)-walk;
        }
      } else {
        myX = myX + (int)(Math.random()*walk)-1;
        myY = myY + (int)(Math.random()*walk)-1;
      }
      


      if (myX<5) {
        myX = 5;
      }
      if (myY<5) {
        myY = 5;
      }
      if (myX>800) {
        myX = 795;
      }
      if (myY>800) {
        myY = 795;
      }
    }
  }