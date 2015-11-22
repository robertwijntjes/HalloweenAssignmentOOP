import java.util.*;

ArrayList<gameRatings> gameRate = new ArrayList<gameRatings>();
ArrayList<Float> data = new ArrayList<Float>();
ArrayList <Float> avgData = new ArrayList <Float>();
ArrayList <Float> radiusPI = new ArrayList <Float>();
ArrayList <Float> stair = new ArrayList <Float>();
ArrayList <String> names1 = new ArrayList <String>();


float sum1,sum2,sum3,sum4,sum5;
float avg1,avg2,avg3,avg4,avg5,t_avg;
float x,y;
int mode = 0;

void setup()
{
  size(1000,1000);
  
  loadData();
  getAvg();
  sortData();
  radiusCal();
  radiusCal1();
  names();
}

void loadData()
{
  String[] lines = loadStrings("gamerate.csv");
  
  for(int i = 0; i < lines.length ; i++)
  {
    gameRatings gamerate = new gameRatings(lines[i]);
    gameRate.add(gamerate);
  }  
}

void getAvg()
{
    for(int i = 0 ; i < gameRate.size() ; i++)
  {
    if( i < 10)
    {
      sum1 += gameRate.get(i).ratings;
    }
    //first genre
    
    if( i > 9 && i < 20)
    {
      sum2 += gameRate.get(i).ratings;
    }
    //second genre
    
    if( i > 19 && i < 30)
    {
      sum3 += gameRate.get(i).ratings;
    }
    //third genre
    
    if( i > 29 && i < 40)
    {
      sum4 += gameRate.get(i).ratings;
    }
    //fourth genre
    
    if( i > 39 && i < 50)
    {
      sum5 += gameRate.get(i).ratings;
    }   
  }
  avg1 = sum1/10;
  avg2 = sum2/10;
  avg3 = sum3/10;
  avg4 = sum4/10;
  avg5 = sum5/10;
  
  t_avg = avg1 + avg2 + avg3 + avg4 + avg5;
  
  avgData.add(avg1);
  avgData.add(avg2);
  avgData.add(avg3);
  avgData.add(avg4);
  avgData.add(avg5);
}

void sortData()
{
  Collections.sort(avgData);
}

void radiusCal()
{
  float angle = (float) TWO_PI / t_avg;
  for( int i = 0; i < avgData.size() ; i++ )
  {
    radiusPI.add(avgData.get(i)*angle);
  }
}

void radiusCal1()
{
  for( int i = 0 ; i < avgData.size() ; i++ )
  {
    stair.add(avgData.get(i)*avgData.get(i)*avgData.get(i));
  }
}

void pieChart()
{
   float start = 0;
   float end = 0;
   float per = 0;
   float centX = (float) width / 2;
   float centY = ((float) height / 2) + 100;
   
  for( int i = 0; i < avgData.size() ; i++ )
  {
      if(i == 0)
      {
        fill(0,225,255);
      }
      if(i == 1)
      {
        fill(178,102,255);
      }
      if(i == 2)
      {
        fill(255,128,0);
      }
      if(i == 3)
      {
        fill(0,204,0);
      }
      if(i == 4)
      {
        fill(255,102,102);
      }
      
      end += radiusPI.get(i);

      if(key == '1')
      {
        arc(centX,centY,250,250,start,end);
      }
      if(key == '2')
      {
        arc(centX,centY,stair.get(i),stair.get(i),start,end);
      } 
      start += radiusPI.get(i); 
  }

}


void menu()
{
  textSize(23);
  fill(255);
  text("OOP Assignment S1Y2",width/2-125,100);
  stroke(255);
  line(314,119,width-300,119);
  text("Press 1: Basic PieChart",width/2-125,200);
  text("Press 2: Advanced PieChart",width/2-125,250);
}

void names()
{
  names1.add("Action");
  names1.add("Simulation");
  names1.add("Role-Playing");
  names1.add("Strategy");
  names1.add("Adventure");
  println(names1);
}

void piChartKey()
{
  float positionX,positionY;
  positionX = width/2 + 300;
  positionY = (height/2) + 200;
  
  for(int i = 0; i < names1.size();i++)
  {
    fill(255);
    textSize(19);
    text(names1.get(i),positionX,positionY);
    positionY += 19;
  }
}

void drawKeyBox()
{
  float boxX,boxY;
  boxX = width/2 + 275;
  boxY = (height/2) + 185;
  
  for(int i = 0 ; i < names1.size() ; i++ )
  {
      if(i == 0)
      {
        fill(0,225,255);
      }
      if(i == 1)
      {
        fill(178,102,255);
      }
      if(i == 2)
      {
        fill(255,128,0);
      }
      if(i == 3)
      {
        fill(0,204,0);
      }
      if(i == 4)
      {
        fill(255,102,102);
      }
      rect(boxX,boxY,10,10);
      boxY += 20;
  }
}
void callall()
{
  pieChart();
  piChartKey();
  drawKeyBox();
}

void draw()
{
    switch (mode)
  {
    case 0:
    {
      background(0);
      menu();
      break;
    }
    case 1:
    {
      background(0);
      menu();
      callall();
      break;
    }
    case 2:
    {
      background(0);
      menu();
      callall();
      break;
    }
  }
}
void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
}
