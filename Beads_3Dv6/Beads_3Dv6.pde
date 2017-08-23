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
int nCs = 2;
int deweyPerClass = 1; 
int noClasses = 1;

// individual bead sizes
int startYear = 2006;  // time vars = bead angle
int noYears = 11;      // number of years per dewey class
int noMonths = 12;
float rScale = 100;

// bead arrangement
float bH = 50;
float classSpacing = 50;
float beadSpacing = 50;
float overallMax = 0;

// for input data storage
Table table;
Table countries;
Table maxes;
Table totals;
float[][] beadMatrix;
float[][] maxMatrix;
float[][] totMatrix;

// for bead testing
int cInd = 11; // china
String cName = "China";
int nBeads = noClasses * deweyPerClass;

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
  beadMatrix = new float[noYears][noMonths];
  
  // create each bead in a for loop
 for (int c=0; c<nCs; c++) {
   
  switch(c) {
    case 0: cName = "China";
    break;
    case 1: cName = "Ireland";
    break;
    case 2: cName = "Israel";
    break;
    default: cName = "Egypt";
    break;
  }
   
  for (int b=0+641; b<nBeads+641; b++) {
    
    // initialize all bead matrix to 0
    for (int m=0; m<noMonths; m++) {
      for (int w=0; w<noYears; w++) {
        beadMatrix[w][m] = 0;
      }
    }
    
    // fill bead matrix
      for(TableRow row : table.matchRows(str(b),"deweyBin")) {
        for (int m=0; m<noMonths; m++) {
          for (int w=0; w<noYears; w++){
            int yr = w + startYear;
            int mn = m + 1;
            if (row.getInt("year(cout)")==yr && row.getInt("month(cout)")==mn) {
              //println("filling matrix [" + w + "][" + m + "]");
              beadMatrix[w][m] = row.getFloat(cName);
              //println(mn + "/" + yr + "," + row.getInt("month(cout)") + "/" + row.getInt("year(cout)") + "," + beadMatrix[y][m]);
            }
          }
        }
      }
    
    // find Bead location
    float bX = floor((b-641)/deweyPerClass) * classSpacing;
    float bZ = ((b-641) % deweyPerClass) * (bH + beadSpacing);
    
    // save max
    overallMax = max(overallMax,max2D(beadMatrix));
    
    println(b);
    println(max2D(beadMatrix));
    println(cName);
    
    
    // create Bead in Bead array
    AllBeads.add(new Bead(beadMatrix,bX,0,bZ,bH,cName));
    
    println(AllBeads.get(AllBeads.size()-1).beadMax);
    println(AllBeads.get(AllBeads.size()-1).nCheckouts[0]);
    
  }
 }
  
}

void draw(){
  //size(1280, 720); // setup the size of the window

  // Make the screen resizable.            
  surface.setResizable(true);
  
  background(230);
    
  // draw data points
  for(int i=0; i<AllBeads.size(); i++) {        
    AllBeads.get(i).drawBead();
  }
  
    //float bx = AllBeads.get(AllBeads.size()-1).beadX; //map(timeParser(Books.get(i).time),  t0, tend, -boxSize/2, boxSize/2);
    //float by = AllBeads.get(AllBeads.size()-1).beadY; //map(dateParser(Books.get(i).date),  d0, dend, -boxSize/2, boxSize/2);
    //float bz = AllBeads.get(AllBeads.size()-1).beadZ; //map(log(Books.get(i).count), log(c0), log(cend), -boxSize/2, boxSize/2);
  //translate(bx,by,bz);

   
}