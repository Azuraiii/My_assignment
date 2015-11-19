class West
{
  float west;
  float dublin;
  
  color colour;
  
  West(String line)
  {
    String[] data = line.split(",");
    
    west = Float.parseFloat(data[0]);
    dublin = Float.parseFloat(data[1]);
    
    colour =color(255,0,0);
  }
  
}
  