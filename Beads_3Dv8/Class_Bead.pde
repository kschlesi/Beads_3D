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
    
    //this.drawBead();
    //this.drawDotSpiral();
    //this.drawLineSpiral();
  }
  
  void drawBead() {
    
    // put coordinates to center of bead
    pushMatrix();
    translate(beadX,beadY,beadZ);
        
    // scale radius to beadMax
      switch(bead_type) {
        case 1: this.drawDotSpiral();
                break;
        case 2: this.drawLineSpiral();
                break;
        //case 3: this.drawDisc();
        //        break;
        case 4: this.drawSlice();
                break;
      }
    // finish draw of bead  
    popMatrix();
  }
    
  void drawDotSpiral() {
    for (int d=0; d<(nSlices*nTimeUnits); d++) { // loop over dots
      float angle = 360 / nTimeUnits;
      float z = beadHeight/2 - dotHeight*d;
      int mx = d % nTimeUnits;
      int sx = floor(d/nTimeUnits);
      float dval = nCheckouts[sx][mx];
      
      // draw a point spiral (one rotation)
      if (beadMax>0) {
          //float rad = dval * rScale;
          float satmap = map(dval,0,beadMax,satMin,satMax);
          float brimap = map(dval,0,beadMax,briMin,briMax);
          float x = cos( radians( mx * angle ) ) * log(dval+1) * rScale;
          float y = sin( radians( mx * angle ) ) * log(dval+1) * rScale;
          stroke(hue,satmap,brimap);
          strokeWeight(2);
          point(x, y, z);
      }
      else {
          stroke(hue,0,0);
          strokeWeight(2);
          point(0, 0, z);
      }
    }
  }
    
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
          //float radmap = map(dval,0,100,radMin,radMax);
          float satmap = map(dval,0,beadMax,satMin,satMax);
          float brimap = map(dval,0,beadMax,briMin,briMax);
          float x = cos( radians( mx * angle ) ) * log(dval+1) * rScale;
          float y = sin( radians( mx * angle ) ) * log(dval+1) * rScale;
          stroke(hue,satmap,brimap);//satmap,brimap);
          strokeWeight(2);
          noFill();
          vertex(x, y, z);
          //println(cName);
          //println(x);
          //println(z);
        }
        else {
          stroke(hue,0,0);
          strokeWeight(2);
          vertex(0, 0, z);
        }
      }
      endShape(OPEN);
  }
    
  void drawSlice()
  {
    float angle = 360 / nTimeUnits;
    
    // draw disc 
    for (int s=0; s<nSlices; s++){
      pushMatrix();
      translate(0,0,sliceZ(s));
      beginShape();
      for (int d = 0; d < nTimeUnits; d++) {
        float dval = nCheckouts[s][d];
        if (beadMax>0) {
          //float radmapT = map(tRadii[i % sides],0,beadMax,radMin,radMax);
          float satmapT = map(dval,0,beadMax,satMin,satMax);
          float brimapT = map(dval,0,beadMax,briMin,briMax);
          float x = cos( radians( d * angle ) ) * log(dval+1) * rScale;
          float y = sin( radians( d * angle ) ) * log(dval+1) * rScale;        
          stroke(hue,satmapT,brimapT);
          fill(hue,satmapT,brimapT);
          vertex( x, y, -sliceHeight/2);
        }
        else {
          stroke(hue,0,0);
          fill(hue,0,0);
          vertex(0,0,-sliceHeight/2);
        }
      }
      popMatrix();
    }
    endShape(CLOSE);
    
    // draw connectors if time
    for (int s=0; s<nSlices; s++){
      pushMatrix();
      translate(0,0,sliceZ(s));
      if (s>0) {
      beginShape(TRIANGLE_STRIP);
    for (int d = 0; d < nTimeUnits + 1; d++) {
      if (beadMax>0) {
        float dval = nCheckouts[s][d % nTimeUnits];
        float dval_last = nCheckouts[s-1][d % nTimeUnits];
        float satmapM = max(map(dval,0,beadMax,satMin,satMax), map(dval_last,0,beadMax,satMin,satMax));
        float brimapM = max(map(dval,0,beadMax,briMin,briMax), map(dval_last,0,beadMax,briMin,briMax));
        float x1 = cos( radians( d * angle ) ) * log(dval+1) * rScale;
        float y1 = sin( radians( d * angle ) ) * log(dval+1) * rScale;
        float x2 = cos( radians( d * angle ) ) * log(dval_last+1) * rScale;
        float y2 = sin( radians( d * angle ) ) * log(dval_last+1) * rScale;
        stroke(hue,satmapM,brimapM);
        strokeWeight(2);
        fill(hue,satmapM,brimapM);
        vertex( x1, y1, -sliceHeight/2);
        vertex( x2, y2, sliceHeight/2);
      }
      else {
        stroke(hue,0,0);
        fill(hue,0,0);
        vertex(0,0,-sliceHeight/2);
        vertex(0,0, sliceHeight/2);
      }
      endShape(CLOSE);
    }
      }
      popMatrix();
    }
} //  
    //// for loop: draws a bead by drawing all slices
    //for(int i=0; i<nSlices+1; i++) {
    
    //  // set radii
    //  if (i==0) {
    //    thisRadii = new float[nTimeUnits];
    //    for(int t=0; t<nTimeUnits; t++) {
    //      thisRadii[t] = 0;
    //    }
    //  }
    //  else if (i!=0) {
    //    thisRadii = nCheckouts[i-1];
    //  }
    //  if (i==nSlices) {
    //    nextRadii = new float[nTimeUnits];
    //    for(int t=0; t<nTimeUnits; t++) {
    //      nextRadii[t] = 0;
    //    }
    //  }
    //  else if (i!=nSlices) {
    //    nextRadii = nCheckouts[i];
    //  }
      
    //  // draw slice
    //  pushMatrix();
    //  translate(0,0,sliceZ(i));
      
    //  // set brightness / saturation (nCheckouts)
      
    //  // scale radius to beadMax
    //  switch(bead_type) {
    //    case 1: drawDotSpiral(rScale,thisRadii,sliceHeight,beadMax,dotHeight,countryHue(cName));
    //            break;
    //    case 2: drawLineSpiral(rScale,thisRadii,sliceHeight,beadMax,dotHeight,countryHue(cName));
    //            break;
    //    case 3: drawDisc(rScale,thisRadii,sliceHeight,beadMax,countryHue(cName));
    //            break;
    //    case 4: drawSlice(rScale,thisRadii,nextRadii,sliceHeight,beadMax,countryHue(cName));
    //            break;
    //  }
      
    //  popMatrix();
    //} // end for loop over slices
    
    //popMatrix();
      
  float sliceZ(int j) {
    // for the jth slice out of nSlices, returns relative z location 
    // of slice center if whole bead center is at (0,0)
    float z = (sliceHeight-beadHeight)/2 + sliceHeight * j;
    return z;
  }
}