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
// declare camera
import peasy.*;
PeasyCam cam;

// general bead organization
int bead_type = 1;    // dots, spiral lines, or objects
int nCs = 6;          // number of countries
int noClasses = 1;    // number of dewey classes
int deweyPerClass = 30;  // number of beads per class (same for all)
int startDewey = 000; // start dewey number (all must be sequential)
int nBeads = noClasses * deweyPerClass;  // total bead number per country
Bead[][] allBeads = new Bead[noClasses*deweyPerClass][nCs];  // init bead array

// individual bead sizes
int startYear = 2006;  // time vars = bead angle
int noYears = 11;      // number of years per dewey class
int noMonths = 12;     // number of months per year
float rScale = 10;     // radius scale
String cName;          // initialize string for bead country name

// bead arrangement in space
float bH = 50;            // bead height
float colSpacing = 50;    // space between strings (cols)
float beadSpacing = 50;   // space between beads (rows)
int colsPerClass = 10;    // number of cols per dewey class
int rowsPerClass = ceil(deweyPerClass / colsPerClass); 

// min and max values for 
// saturation and brightness
float satMin = 35; //35
float satMax = 99; //99
float briMin = 35; //10
float briMax = 99; //99

// for input data storage
Table table;
//Table countries;
//Table maxes;
//Table totals;
float[][] beadMatrix;  // holds bead checkout values
//float[][] maxMatrix;   // holds max checkout vals 
//float[][] totMatrix;   // hold total checkout vals

// interaction
boolean cSwitch[] = new boolean[nCs];
boolean iSwitch;

void setup(){
  // size and view
  size(1300, 1300, P3D);
  colorMode(HSB, 360, 100, 100);
  translate(width/2 - colSpacing/2,height/2,0);
  cam = new PeasyCam(this, 500);
  perspective(PI/20, width/height, 1, 10000);
  cam.setWheelScale(0.1);
  
  // load in data to tables
  table = loadTable("q3_country_dewey_3D.csv", "header");
  //maxes = loadTable("q3_cdy_maxbins.csv","header");
  //totals = loadTable("q3_cdy_totcout.csv");
  //countries = loadTable("q3_countries.csv");
  
  // set all interaction switches to defaults
  iSwitch = true;              // instructions on
  for (int c=0; c<nCs; c++) {  // all countries on
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
    int bClass = floor(b/deweyPerClass);                        // current class
    int bRow = floor((b-bClass*deweyPerClass)/colsPerClass);    // current row IN CLASS
    int bCol = (b-bClass*deweyPerClass) % colsPerClass;         // current col
    float bX = bCol * colSpacing - (colsPerClass * colSpacing)/2;           // x pos
    float bZ = -1 * (bRow + (rowsPerClass * bClass)) * (bH + beadSpacing);  // z pos
    
    // create Bead in Bead array
    allBeads[b][c] = new Bead(beadMatrix,bX,0,bZ,bH,cName);
    
  } // end loop over number of beads
 }  // end loop over number of countries

}

void draw(){
  //size(1280, 720); // setup the size of the window

  // Make the screen resizable.            
  surface.setResizable(true);
  
  // set background and initial position of array
  background(250);
  //translate(width/2-colSpacing/2,height/2,0);
  cam.rotateX(0);
    
  // draw beadstrings
  for (int s=0; s<colsPerClass; s++){
    float strx = s*colSpacing - (colsPerClass*colSpacing)/2;
    float strz = -1 * ((rowsPerClass*noClasses-1) * (bH + beadSpacing));
    stroke(0,0,75);
    strokeWeight(1);
    line(strx, 0, beadSpacing, strx, 0, strz);    
  }
    
  // draw data points
  for(int c=0; c<nCs; c++) {
    for (int b=0; b<noClasses*deweyPerClass; b++) {
      if (cSwitch[c] == true) {
        allBeads[b][c].drawBead();
      }
    }
  }
  
  // draw labels
  // topic labels
  //if(lSwitch==true) {
  //  
  //}
   
}