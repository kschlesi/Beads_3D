class Bead{
  int nTimeUnits, nSlices;
  float[][] nCheckouts;
  float beadX, beadY, beadZ, beadHeight, sliceHeight, dotHeight;
  float[] thisRadii;
  float[] nextRadii;
  float beadMax;
  String cName;
  float hue;
  
  Bead(float[][] nCheckouts, float beadX, float beadY, float beadZ, float beadHeight, String cName){
    this.nCheckouts = nCheckouts;
    this.nSlices = nCheckouts.length;
    this.nTimeUnits = nCheckouts[0].length;
    this.beadX = beadX;
    this.beadY = beadY;
    this.beadZ = beadZ;
    this.beadHeight = beadHeight;
    this.sliceHeight = beadHeight / nSlices;
    this.dotHeight = sliceHeight / nTimeUnits;
    this.beadMax = max2D(nCheckouts);
    this.cName = cName;
    this.hue = countryHue(cName);
    
    this.drawBead();
  }
  
  void drawBead() {
    
    // put coordinates to center of bead
    pushMatrix();
    translate(beadX,beadY,beadZ);
    
    // for loop: draws a bead by drawing all slices
    for(int i=0; i<nSlices+1; i++) {
    
      // set radii
      if (i==0) {
        thisRadii = new float[nTimeUnits];
        for(int t=0; t<nTimeUnits; t++) {
          thisRadii[t] = 0;
        }
      }
      else if (i!=0) {
        thisRadii = nCheckouts[i-1];
      }
      if (i==nSlices) {
        nextRadii = new float[nTimeUnits];
        for(int t=0; t<nTimeUnits; t++) {
          nextRadii[t] = 0;
        }
      }
      else if (i!=nSlices) {
        nextRadii = nCheckouts[i];
      }
      
      // draw slice
      pushMatrix();
      translate(0,0,sliceZ(i));
      
      // set brightness / saturation (nCheckouts)
      
      // scale radius to beadMax
      switch(bead_type) {
        case 1: drawDotSpiral(rScale,thisRadii,sliceHeight,beadMax,dotHeight,hue);
                break;
        case 2: drawLineSpiral(rScale,thisRadii,sliceHeight,beadMax,dotHeight,hue);
                break;
        case 3: drawDisc(rScale,thisRadii,sliceHeight,beadMax,hue);
                break;
        case 4: drawSlice(rScale,thisRadii,nextRadii,sliceHeight,beadMax,hue);
                break;
      }
      
      popMatrix();
    } // end for loop over slices
    
    popMatrix();
    
  } // end bead draw
  
  float sliceZ(int j) {
    // for the jth slice out of nSlices, returns relative z location 
    // of slice center if whole bead center is at (0,0)
    float z = (sliceHeight-beadHeight)/2 + sliceHeight * j;
    return z;
  }
}