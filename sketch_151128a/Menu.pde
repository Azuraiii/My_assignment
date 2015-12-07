class Menu   
{
  //this variable deals with the image
  PImage background;
  //coordinates !
  float dublinX = 415;
  float dublinY = 250;
  
  float westX = 150;
  float westY = 200;
  
  float westXX = 200;
  float westYY = 250;

  Menu()
  {
  }

  void update()
  {
    //loads the image
    background=loadImage("ireland_map.jpg");
    //resizes it to fit the screen
    background.resize(500, 500);
    background(background);
  }

  //draws the points on dublin, mayo and galway
  void points()
  {
    fill(0,255,0);
    ellipse(dublinX, dublinY, 10, 10);
    fill(255,0,0);
    ellipse(westX, westY, 15, 15);
    fill(0,0,255);
    ellipse(westXX, westYY, 15, 15);
  }
  
}