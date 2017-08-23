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

// for bead array
//int nBeads;
ArrayList<Bead> AllBeads = new ArrayList<Bead>();
int bead_type = 1;

// individual bead sizes
int startYear = 2006;  // time vars = bead angle
int noYears = 10;      // number of years per dewey class
int noMonths = noYears * 12;
int nBeadSlices = 100; // number of height slices per bead

// default reg exp for dewey class
String deweyRegExp = "3..";
String dRE = "3";
String dRE_read;

// for input data storage
Table table;
Table countries;
Table maxes;
Table totals;
float[][] beadMatrix;
float[][] maxMatrix;
float[][] totMatrix;

// for bead testing
//Bead myBead;
int cInd = 11; // china
String cName = "China";
float bZ;
int nBeads = 4;

void setup(){
  size(1300, 1300, P3D);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, 300);
  cam.setWheelScale(0.1);
  
  // load in data to tables
  countries = loadTable("q3_countries.csv");
  table = loadTable("q3_country_dewey_3D.csv", "header");
  maxes = loadTable("q3_cdy_maxbins.csv","header");
  totals = loadTable("q3_cdy_totcout.csv");
  
  // create a single Bead matrix
  beadMatrix = new float[nBeadSlices][noMonths];
  
  // create each bead in a for loop
  for (int b=0; b<nBeads; b++) {
    
    // set deweyRegExp and country
    switch (b) {
      case 0: deweyRegExp = "9..";
              dRE = "9";
              cName = "China";
              bZ = 0;
              break;
      case 1: deweyRegExp = "3..";
              dRE = "3";
              cName = "Iraq";
              bZ = -50;
              break;
      case 2: deweyRegExp = "8..";
              dRE = "8";
              cName = "Japan";
              bZ = 50;
              break;
      case 3: deweyRegExp = "2..";
              dRE = "2";
              cName = "Israel";
              bZ = 100;
              break;        
    }
    
    // initialize all bead matrix to 0
    for (int s=0; s<nBeadSlices; s++) {
      for (int t=0; t<noMonths; t++) {
        beadMatrix[s][t] = 0;
      }
    }
    
    // fill bead matrix
    for (int s=0; s<nBeadSlices; s++) {
      dRE_read = dRE + nf(s,2);
      for(TableRow row : table.matchRows(dRE_read,"deweyBin")) {
        for (int t=0; t<noMonths; t++) {
          int yr = floor(t/12) + startYear;
          int mn = (t % 12) + 1;
          if (row.getInt("year(cout)")==yr && row.getInt("month(cout)")==mn) {
            //println("filling matrix [" + s + "][" + t + "]")
            beadMatrix[s][t] = row.getFloat(cName);
            //println(mn + "/" + yr + "," + row.getInt("month(cout)") + "/" + row.getInt("year(cout)") + "," + beadMatrix[s][t]);
          }
        }
      }
    }
    
    // create Bead in Bead array
    AllBeads.add(new Bead(beadMatrix,0,0,bZ,10,cName));
    
  }
  
}

void draw(){
  //size(1280, 720); // setup the size of the window

  // Make the screen resizable.            
  surface.setResizable(true);
  
  background(200);
  
  //printGrid(beadMatrix);
  
  // draw data points
  for(int i=0; i<AllBeads.size(); i++) {
    float x = 0; //map(timeParser(Books.get(i).time),  t0, tend, -boxSize/2, boxSize/2);
    float y = 0; //map(dateParser(Books.get(i).date),  d0, dend, -boxSize/2, boxSize/2);
    float z = 0; //map(log(Books.get(i).count), log(c0), log(cend), -boxSize/2, boxSize/2);
    
    pushMatrix();
    translate(x,y,z);
    AllBeads.get(i).drawBead();
    popMatrix();
  }
   
}