void drawLabels() {
  for (int cl=0; cl<noClasses; cl++) {
    pushMatrix();
      rotateX(radians(90));
      rotateZ(radians(270));
      textAlign(LEFT, CENTER);
      textSize(lpix);
      stroke(0,0,80);
      float tx = (rowsPerClass * cl) * (bH + beadSpacing) + 3*lpix/4;
      float ty = -1*(colsPerClass*colSpacing)/2 - lpix;
      text(deweyTitle(floor(startDewey/100)+cl), tx, ty);
    popMatrix();
  }
}