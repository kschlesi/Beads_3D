/*************************************************************************************
Data Visualization - Basic 3D Demo                
Tested in Processing 3                                    
                                                     
Author: Rodger (Jieliang) Luo                        
Supervisor: George Legrady                           

Purpose: Show how to present volume data in a basic 3D environment     

Usage: 1. A mouse left-drag will rotate the camera around the subject.
          2. A right drag will zoom in and out. 
          3. A middle-drag (command-left-drag on mac) will pan. 
          4. A double-click restores the camera to its original position. 
          5. The shift key constrains rotation and panning to one axis or the other.
*************************************************************************************/

import peasy.*;
PeasyCam cam;
ArrayList<Bead> AllBeads = new ArrayList<Bead>();
int nBeads;

// 2D matrix table related variables
Table table;
Table countries;
Table maxes;
Table totals;
//Table subtitles;
//int numRows, numColumns;
//int dispRows = 0; // number of rows (dewey classes x years) to display
//float[][] dataMatrix;
float[][] beadMatrix;
float[][] maxMatrix;
float[][] totMatrix;
//float maxValue, minValue;
int noYears = 10;   // number of years per dewey class
int noMonths = noYears * 12;
int noInClass = 10; // size of dewey class bin
int startYear = 2006;
int nBeadSlices = 100;
String deweyRegExp = "9..";
String dRE = "9";
String dRE_read;

Bead myBead;
int cInd = 4;

// box layout
//float boxSize = 100;
//float t0 = 600;
//float tend = 1220;
//float d0 = 0;
//float dend = 3650;
//float c0 = 1;
//float cend = 13000;

void setup(){
  size(1300, 1300, P3D);
  cam = new PeasyCam(this, 300);
  
  // load in data
  countries = loadTable("q3_countries.csv");
  table = loadTable("q3_country_dewey_3D.csv", "header");
  maxes = loadTable("q3_cdy_maxbins.csv","header");
  totals = loadTable("q3_cdy_totcout.csv");
  
  // create a single Bead matrix
  beadMatrix = new float[nBeadSlices][noMonths];
  for (int s=0; s<nBeadSlices; s++) {
    dRE_read = dRE + nf(s,2);
    //int j = 0;
    for(TableRow row : table.matchRows(dRE_read,"deweyBin"))
      {
        for (int t=0; t<noMonths; t++) {
          int yr = floor(t/12);
          int mn = t % 12;
          if (row.getInt("year(cout)")==yr && row.getInt("month(cout)")==mn) {
            beadMatrix[s][t] = row.getFloat(cInd);
          }
          else beadMatrix[s][t] = 0;
        
          //beadMatrix[s][j] = row.getFloat(2);
          //j++;
          //if (j==noMonths) break;
        }
      }
  }
  myBead = new Bead(beadMatrix,0,0,0,50);
  println(beadMatrix.length,beadMatrix[0].length);
  
  
  //for(int i=0; i<numRows; i++) {
    // create a Bead in AllBeads with the correct subset of data
    
    //Beads.add(new Bead(elements,times,dates,counts,titles));
  //}
  
}

void draw(){
  //size(1280, 720); // setup the size of the window

  // Make the screen resizable.            
  surface.setResizable(true);
  
  background(100);
  
  // draw data points
  //for(int i=0; i<Books.size(); i++) {
    float x = 0; //map(timeParser(Books.get(i).time),  t0, tend, -boxSize/2, boxSize/2);
    float y = 0; //map(dateParser(Books.get(i).date),  d0, dend, -boxSize/2, boxSize/2);
    float z = 0; //map(log(Books.get(i).count), log(c0), log(cend), -boxSize/2, boxSize/2);
    
    stroke(10);
    pushMatrix();
    translate(x,y,z);
    //text(str(myBead.nTimeUnits),0,0);
    myBead.drawBead();
    popMatrix();
  //}
   
}