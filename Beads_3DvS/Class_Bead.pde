class Bead{
  int nTimeUnits, nSlices;
  float[][] nCheckouts;
  float beadX, beadY, beadZ, beadHeight, sliceHeight, dotHeight;
  float[] thisRadii;
  float[] nextRadii;
  float beadMax;
  String cName;
  float hue;
  int deweyNumber;
  
  Bead(float[][] nCheckouts, float beadX, float beadY, float beadZ, float beadHeight, String cName, int deweyNumber){
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
    this.deweyNumber = deweyNumber;
  }
  
  void drawBead() {
    
    // put coordinates to center of bead
    pushMatrix();
    translate(beadX,beadY,beadZ);
    this.drawLineSpiral();    
      
    // mouseover?
   if (cPrint==cName) {  // use only one country
    float mouseDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
    if (mouseDistance < sq(20) && deweyNumber>=0)
    {
      if (mSwitch) {
        theTxt = theTxt + deweyNumber + " : " + deweyLabels[deweyNumber] + "\n";
        dispTxt = true;
      }
      if (tLabels) {
        this.drawTimeLabels();
      }
    }
   }
    
    // finish draw of bead  
    popMatrix();
  }
  
  // bead draw function called by drawBead()     
  void drawLineSpiral() {
    beginShape();
    for (int d=0; d<(nSlices*nTimeUnits); d++) { // loop over dots
      float angle = 360 / nTimeUnits;
      float z = beadHeight/2 - dotHeight*d;
      int mx = d % nTimeUnits;
      int sx = floor(d/nTimeUnits);
      float dval = nCheckouts[sx][mx];
      
      // draw a point spiral (one rotation)
      if (beadMax>0) {
          float satmap = map(dval,0,beadMax,satMin,satMax);
          float brimap = map(dval,0,beadMax,briMin,briMax);
          float x = cos( radians( mx * angle ) ) * log(dval+1) * rScale;
          float y = sin( radians( mx * angle ) ) * log(dval+1) * rScale;
          stroke(hue,satmap,brimap);
          strokeWeight(2);
          noFill();
          vertex(x, y, z);
        }
        else {
          stroke(hue,0,0);
          strokeWeight(2);
          vertex(0, 0, z);
        }
      }
      endShape(OPEN);
  }
  
  // draw time labels on a single bead
  void drawTimeLabels() {
    pushMatrix();
      translate(0,0,beadHeight/2 + dpix); // top of bead
      stroke(0,0,80);
      textSize(dpix);
      text("Jan",colSpacing/2-10,0,0);
      text("Apr",0,colSpacing/2-10,0);
      text("Jul",-colSpacing/2+10,0,0);
      text("Oct",0,-colSpacing/2+10,0);
    popMatrix();
    pushMatrix();
      rotateY(radians(-90));
      translate(0,0,colSpacing/2-5);
      text("2016",-beadHeight/2 + sliceHeight/2,10,0);
      text("2006",beadHeight/2 - sliceHeight/2,10,0);
    popMatrix();
  }
}