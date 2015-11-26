class Graph3 extends Main
{
  PImage image1;
  AudioPlayer audio;
  
  Graph3()
  {
    image1 = loadImage("rent222.jpg");
    image1.resize(500,500);
    audio = minim.loadFile("applause_y.wav");
  }
  
  void display()
  {
    background(image1);
  }
  
  void audio()
  {
    audio.rewind();
    audio.play();
  }
}