class West
{
  //west and dublin
  float west;
  float dublin;
  
  West(String line)
  {
    String[] data = line.split(",");
    west = Float.parseFloat(data[0]);
    dublin = Float.parseFloat(data[1]); 
  }
  
}