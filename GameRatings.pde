class gameRatings
{
  float ratings;
  String category;
  float average;
  
  gameRatings(String line)
  {
    String[] parts = line.split(";");
    ratings = Float.parseFloat(parts[0]);
    category = parts[1];
  }
  
  
}
