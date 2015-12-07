class Audio
{
  
  AudioPlayer audio;
  
  Audio()
  {
    audio = minim.loadFile("applause_y.wav"); 
  }
  
  void audio()
    {
      audio.rewind();
      audio.play();
    }
    
}