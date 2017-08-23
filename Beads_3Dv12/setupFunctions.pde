// setup camera
void setupCamera() {
  cam = new PeasyCam(this, 500);
  perspective(PI/20, width/height, 1, 10000);
  cam.setWheelScale(0.1);
}

void setSwitches() {
  // set all interaction switches to defaults
  iSwitch = true;              // instructions on
  lSwitch = true;              // labels on
  dispTxt = false;             // no initial mouseover
  cSwitch = new boolean[nCs];
  for (int c=0; c<nCs; c++) {  // all countries on
    cSwitch[c] = true;
  }
}

void createDeweyBeads() {
 // load in data to tables
  table = loadTable("q3_country_dewey_3D.csv", "header");
  
 // create each bead in a for loop
 for (int c=0; c<nCs; c++) {
   
   cName = countryName(c);
   
  for (int b=0; b<nBeads; b++) {
    
    // initialize all bead matrix to 0
    beadMatrix = new float[noYears][noMonths];
    for (int m=0; m<noMonths; m++) {
      for (int w=0; w<noYears; w++) {
        beadMatrix[w][m] = 0;
      }
    }
    
    // fill bead matrix
      for(TableRow row : table.matchRows("^" + str(b+startDewey) + "$","deweyBin")) {
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
    allBeads[b][c] = new Bead(beadMatrix,bX,0,bZ,bH,cName,b+startDewey);
    
  } // end loop over number of beads
 }  // end loop over number of countries
}