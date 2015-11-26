class Graph1 extends Main
{
  PImage image1;
  AudioPlayer audio;
  
  Graph1()
  {
    image1 = loadImage("compensation22.jpg");
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