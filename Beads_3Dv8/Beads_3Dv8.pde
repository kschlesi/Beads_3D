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
int camMode = 0;

// for bead array
//int nBeads;
//ArrayList<Bead> AllBeads = new ArrayList<Bead>();
int bead_type = 1;
int nCs = 6;
int deweyPerClass = 10; 
int noClasses = 10;
int startDewey = 000;
Bead[][] allBeads = new Bead[noClasses*deweyPerClass][nCs];

// individual bead sizes
int startYear = 2006;  // time vars = bead angle
int noYears = 11;      // number of years per dewey class
int noMonths = 12;
float rScale = 10;

// bead arrangement
float bH = 50;
float classSpacing = 50;
float beadSpacing = 50;

// min and max values for 
// saturation and brightness
float satMin = 35; //35
float satMax = 99; //99
float briMin = 35; //10
float briMax = 99; //99

//// min value for single bead radius
//float radMin = 1;
//float radMax = 10;

// for input data storage
Table table;
Table countries;
Table maxes;
Table totals;
float[][] beadMatrix;
float[][] maxMatrix;
float[][] totMatrix;

// interaction
boolean cSwitch[] = new boolean[nCs];

// for bead testing
String cName;
int nBeads = noClasses * deweyPerClass;

void setup(){
  size(1300, 1300, P3D);
  colorMode(HSB, 360, 100, 100);
  cam = new PeasyCam(this, deweyPerClass*(bH+beadSpacing)+500); //2000
  perspective(PI/20, width/height, 1, 10000);
  //cam.rotateX(1/(tan(25/(deweyPerClass*(bH+beadSpacing))))); // pitch up
  cam.setWheelScale(0.1);
  
  // load in data to tables
  countries = loadTable("q3_countries.csv");
  table = loadTable("q3_country_dewey_3D.csv", "header");
  maxes = loadTable("q3_cdy_maxbins.csv","header");
  totals = loadTable("q3_cdy_totcout.csv");
  
  // set all country display switches to true
  for (int c=0; c<nCs; c++) {
    cSwitch[c] = true;
  }
  
  // create each bead in a for loop
 for (int c=0; c<nCs; c++) {
   
  switch(c) {
    case 0: cName = "China";
    break;
    case 1: cName = "Ireland";
    break;
    case 2: cName = "Israel";
    break;
    case 3: cName = "Spain";
    break;
    case 4: cName = "Japan";
    break;
    default: cName = "Cuba";
    break;
  }
   
  for (int b=0; b<nBeads; b++) {
    
    // initialize all bead matrix to 0
    beadMatrix = new float[noYears][noMonths];
    for (int m=0; m<noMonths; m++) {
      for (int w=0; w<noYears; w++) {
        beadMatrix[w][m] = 0;
      }
    }
    
    // fill bead matrix
      for(TableRow row : table.matchRows(str(b+startDewey),"deweyBin")) {
        for (int m=0; m<noMonths; m++) {
          for (int w=0; w<noYears; w++){
            int yr = w + startYear;
            int mn = m + 1;
            if (row.getInt("year(cout)")==yr && row.getInt("month(cout)")==mn) {
              beadMatrix[w][m] = row.getFloat(cName);
            }
          }
        }
      }
    
    // find Bead location
    float bX = floor(b/deweyPerClass) * classSpacing - (noClasses*classSpacing)/2; 
    float bZ = (b % deweyPerClass) * (bH + beadSpacing);
    
    // create Bead in Bead array
    allBeads[b][c] = new Bead(beadMatrix,bX,0,bZ,bH,cName);
    
  } // end loop over number of beads
 }  // end loop over number of countries
 
}

void draw(){
  //size(1280, 720); // setup the size of the window

  // Make the screen resizable.            
  surface.setResizable(true);
  
  background(250);
  translate(width/2+classSpacing/2,height/2,0);    
  cam.lookAt(width/2+classSpacing/2,height/2,0); // 50 ms animation time

  // set a particular camera view
  switch (camMode) {
    // road view
    case 1: cam.reset(50); // 50 ms to reset
            cam.setRotations(radians(30),0,0); // pitch up
            cam.setFreeRotationMode();
            //cam.setSuppressRollRotationMode();
            //cam.setPitchRotationMode();
            break;
    // hanging view
    case 2: float camrot[] = cam.getRotations();
            double camdist = cam.getDistance();
            println(camrot[0],camrot[1],camrot[2],camdist);
            break;
    // unconstrain view
    case 0: cam.setFreeRotationMode();
            break;
  }
    
    
  // draw beadstrings
  for (int s=0; s<noClasses; s++){
    float strx = s*classSpacing - (noClasses*classSpacing)/2;
    float strz = deweyPerClass * (bH + beadSpacing);
    stroke(0,0,75);
    strokeWeight(1);
    line(strx, 0, 0, strx, 0, strz);    
  }
    
  // draw data points
  for(int c=0; c<nCs; c++) {
    for (int b=0; b<noClasses*deweyPerClass; b++) {
      if (cSwitch[c] == true) {
        allBeads[b][c].drawBead();
      }
    }
  }
  
    //float bx = AllBeads.get(AllBeads.size()-1).beadX; //map(timeParser(Books.get(i).time),  t0, tend, -boxSize/2, boxSize/2);
    //float by = AllBeads.get(AllBeads.size()-1).beadY; //map(dateParser(Books.get(i).date),  d0, dend, -boxSize/2, boxSize/2);
    //float bz = AllBeads.get(AllBeads.size()-1).beadZ; //map(log(Books.get(i).count), log(c0), log(cend), -boxSize/2, boxSize/2);
  //translate(bx,by,bz);

   
}