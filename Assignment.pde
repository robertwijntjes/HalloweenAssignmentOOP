/*
  Author: Robert Wijntjes
 Data:30/11/2015
 Class: DT282/2
 Code: C14356786
 Discription: This assignment has the following types of graphs. 
 1. Pie Chart   
 2. Stair Pie Chart  
 3. Plot Graph. 
 These Graphs are used to illustrate the information in which i collected.This data involves the average ratings of games within a genre.
 */


import java.util.*;
//Importing a Library

ArrayList<gameRatings> gameRate = new ArrayList<gameRatings>();
ArrayList<Float> data = new ArrayList<Float>();
ArrayList <Float> avgData = new ArrayList <Float>();
ArrayList <Float> radiusPI = new ArrayList <Float>();
ArrayList <Float> stair = new ArrayList <Float>();
ArrayList <String> names1 = new ArrayList <String>();
//Declaring Arraylists


float sum1, sum2, sum3, sum4, sum5;
float avg1, avg2, avg3, avg4, avg5, t_avg;
float x, y;
int mode = 0;
//Declaring a few Global Variables

void setup()
{
  size(1000, 1000);

  loadData();
  getAvg();
  sortData();
  radiusCal();
  radiusCal1();
  names();
  //Calling all Default Functions.
}

void loadData()
{
  String[] lines = loadStrings("gamerate.csv");

  for (int i = 0; i < lines.length; i++)
  {
    gameRatings gamerate = new gameRatings(lines[i]);
    gameRate.add(gamerate);
  }  
  //Loading Data into Arraylist
}

void getAvg()
{
  for (int i = 0; i < gameRate.size (); i++)
  {
    if ( i < 10)
    {
      sum1 += gameRate.get(i).ratings;
    }
    //first genre

    if ( i > 9 && i < 20)
    {
      sum2 += gameRate.get(i).ratings;
    }
    //second genre

    if ( i > 19 && i < 30)
    {
      sum3 += gameRate.get(i).ratings;
    }
    //third genre

    if ( i > 29 && i < 40)
    {
      sum4 += gameRate.get(i).ratings;
    }
    //fourth genre

    if ( i > 39 && i < 50)
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
  //Getting the average and Totals
}

void sortData()
{
  Collections.sort(avgData);
  //Sorting the Data
}

void radiusCal()
{
  float angle = (float) TWO_PI / t_avg;
  for ( int i = 0; i < avgData.size (); i++ )
  {
    radiusPI.add(avgData.get(i)*angle);
  }
  //Getting the Portions for the Pie chart
}

void radiusCal1()
{
  for ( int i = 0; i < avgData.size (); i++ )
  {
    stair.add(avgData.get(i)*avgData.get(i)*avgData.get(i));
    //Getting the extensions for the pie chart
  }
}

void pieChart()
{
  float start = 0;
  float end = 0;
  float per = 0;
  float centX = (float) width / 2;
  float centY = ((float) height / 2) + 100;

  for ( int i = 0; i < avgData.size (); i++ )
  {
    if (i == 0)
    {
      fill(0, 225, 255);
    }
    if (i == 1)
    {
      fill(178, 102, 255);
    }
    if (i == 2)
    {
      fill(255, 128, 0);
    }
    if (i == 3)
    {
      fill(0, 204, 0);
    }
    if (i == 4)
    {
      fill(255, 102, 102);
    }

    end += radiusPI.get(i);

    if (key == '1')
    {
      arc(centX, centY, 250, 250, start, end);
    }
    if (key == '2')
    {
      arc(centX, centY, stair.get(i), stair.get(i), start, end);
    } 
    start += radiusPI.get(i);
  }
  //Drawing the pie chart.
}


void menu()
{
  strokeWeight(1);
  textSize(23);
  fill(255);
  text("OOP Assignment S1Y2", width/2-125, 100);
  stroke(255);
  line(314, 119, width-300, 119);
  text("Press 1 and 2: Basic Pi-Chart", width/2-125, 200);
  text("Press 3: Advanced PieChart", width/2-125, 250);
  text("Press 4: Exit Program", width/2-125, 300);
  //Menu Function
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
  float positionX, positionY;
  positionX = width/2 + 300;
  positionY = (height/2) + 200;

  for (int i = 0; i < names1.size (); i++)
  {
    fill(255);
    textSize(19);
    text(names1.get(i), positionX, positionY);
    positionY += 19;
  }
  //Key for PieChart Information
}

void drawKeyBox()
{
  float boxX, boxY;
  boxX = width/2 + 275;
  boxY = (height/2) + 185;

  for (int i = 0; i < names1.size (); i++ )
  {
    if (i == 0)
    {
      fill(0, 225, 255);
    }
    if (i == 1)
    {
      fill(178, 102, 255);
    }
    if (i == 2)
    {
      fill(255, 128, 0);
    }
    if (i == 3)
    {
      fill(0, 204, 0);
    }
    if (i == 4)
    {
      fill(255, 102, 102);
    }
    rect(boxX, boxY, 10, 10);
    boxY += 20;
  }
  //Drawing the boxes corrosponding colors
}

void drawBar()
{
  float max = 0.0f;
  float gap = (float) width/gameRate.size();
  for (gameRatings rate : gameRate)
  {
    if ( max < rate.ratings)
    {
      max = rate.ratings;
    }
  }

  float scaler = height/ (float) max;
  for ( int i = 0; i < gameRate.size (); i++ )
  {
    stroke(gameRate.get(i).colour);
    fill(gameRate.get(i).colour);
    float x = i * gap;
    rect(x, height, gap, -(gameRate.get(i).ratings * scaler));
  }
  //Drawing the bar chart
}

void drawLine()
{

  float topside = 0.8f;
  float gap = (width) / ((float)gameRate.size());
  float max = 0; 
  int switch_t = 1;

  for (gameRatings rate : gameRate)
  {
    if ( max < rate.ratings)
    {
      max = rate.ratings;
    }
  }
  //FIND THE MAX

  float scaler = height / ((float) max );
  // SCALE THE TOP

  for (int i = 1; i < gameRate.size (); i++)
  {
    fill(gameRate.get(i).colour);
    strokeWeight(3);
    stroke(gameRate.get(i).colour);
    float x1 = (((i - 1) * gap)*topside + 100);
    float x2 = ((i * gap)* topside + 100);
    float y1 = height - ((gameRate.get(i-1).ratings * scaler)* topside -200);
    float y2 = height - ((gameRate.get(i).ratings * scaler)* topside -200);
    line(x1, y1, x2, y2);
    //DRAWS GRAPH
    textSize(10);    
    if (switch_t == 1)
    {
      text(gameRate.get(i).category, x1, y2);
      switch_t--;
    } else
    {
      text(gameRate.get(i).category, x1, y2);
      switch_t ++;
    }
  } 
  stroke(255);
  line(100, 400, 100, height-120); //x
  line(100, height -120, width -115, height -120); //y
  //Drawing the LinePlot
}

void exitP()
{
  exit();
  //Exit Function
}
void callall()
{
  pieChart();
  piChartKey();
  drawKeyBox();
  //Special call for ordering purposes
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

  case 3:
    {
      background(0);
      drawLine();
      menu();
      break;
    }

  case 4:
    {
      exitP();
      break;
    }
  }
  //Interface
}
void keyPressed()
{

  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  //Interaction for the Interface.
}

