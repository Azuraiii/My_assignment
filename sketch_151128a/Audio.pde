class Audio
{
  
  AudioPlayer audio;
  
  Audio()
  {
    //loads audio file
    audio = minim.loadFile("applause_y.wav"); 
  }
  
  void audio()
    {
      audio.rewind();
      audio.play();
    }
    
}