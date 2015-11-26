class gameRatings
{
  float ratings;
  String category;
  float average;
  color colour;
  
  gameRatings(String line)
  {
    String[] parts = line.split(";");
    ratings = Float.parseFloat(parts[0]);
    category = parts[1];
    colour = color(random(0,255),random(0,255),random(0,255));
  }
  
}
