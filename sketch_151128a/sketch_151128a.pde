//for sounds //<>//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.*;

Minim minim;

//this is the colors i used for the dynamic background
color[] beach = {#D9C6B0, #314650, #2D4761, #45718C, #B6E1F2};
color[] palette = beach;

//array list to store the data
ArrayList<West> westArray = new ArrayList<West>();
String[] lines;

// used so i can change them from the DrawTrendLineGraph class
public static int counter = 0;
public static int textcounter = 0;

int drawcounter = 0;
int s = 50;

//used to audio
Audio audio;

void setup()
{
  size(500, 500);

  minim = new Minim(this);
  audio = new Audio();
}

// Classes
DrawTrendLineGraph drawtrendlinegraph = new DrawTrendLineGraph();
Menu menu = new Menu();

//Loads first data
void loadData1()
{
  //loads data to a string array
  String[] lines = loadStrings("compensation.csv");
  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}

//loads the second data set
void loadData2()
{
  //loads data to a string array
  String[] lines = loadStrings("selfemployed.csv");

  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}

//loads the third data set
void loadData3()
{
  //loads data to a string array
  String[] lines = loadStrings("disposable_income.csv");

  //For loop for filling the global ArrayList
  for (int i=0; i<lines.length; i++)
  {
    //make new element for DublinWest class
    West westElement = new West(lines[i]);
    //Add this element to the ArrayList called westArray
    westArray.add(westElement);
  }
}

void keyPressed()
{
  //pressing space resets the counter thus bringing it back to the menu
  if (key ==' ')
  {
    counter = 0;
    drawcounter = 0;
    textcounter = 0;
    //clearing the arraylist
    westArray.clear();
  }
  
  //presing 1 brings the first graph
  if (key == '1')
  {
    westArray.clear();
    counter = 1;
    textcounter = 1;
  }
  
  //pressing 2 brings the second graph
  if (key == '2')
  {
    westArray.clear();
    counter = 2;
    textcounter = 2;
  }

  //pressing 3 brings the third graph
  if (key == '3')
  {
    westArray.clear();
    counter = 3;
    textcounter = 3;
  }
}

void draw()
{

  //frameRate(5);
  smooth();
  strokeWeight(5);
  noFill();

  if (counter == 0);
  {
    //initially the counter will be 0 to load the menu class
    menu.update();
    menu.points();
  }

  if (counter == 1)
  {
    //loads the first data
    loadData1();
    //counter turns to 5 to stop continously loading the data
    counter = 5;
    //draw counter is used to create the graph.
    drawcounter = 1;
    //sound
    audio.audio();
  }

  if (counter == 2)
  {
    //load second data
    loadData2();
    counter = 5;
    drawcounter = 1;
    audio.audio();
  }

  if (counter == 3)
  {
    loadData3();
    counter = 5;
    drawcounter = 1;
    audio.audio();
  }

  if (drawcounter == 1)
  {
    //draws the dynamic background
    drawBackground1();
    //calls on the DrawTrendLineGraph class to draw the line and the axis
    drawtrendlinegraph.update();
    drawtrendlinegraph.drawaxis();
  }
}

//this function deals with the dynamic background
void drawBackground1()
{
  //squares are initialised, colors are randomised.
  noStroke();
  for (int x = 0; x < width; x += s)
  {
    for (int y = 0; y < height; y += s)
    {
      //randomises the fill using the blue colors array list initialised above
      fill(palette[int(random(1, 5))]);
      rect(x, y, s, s);
    }
  }
  fill(palette[int(random(1, 5))]);
  int x = int(random(width/s))*s;
  int y = int(random(height/s))*s;
  rect(x, y, s, s);
}