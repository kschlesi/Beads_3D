float offsetY;

void keyPressed()
{
  //if (key == 'n' || key == 'N') {
  //  if (normalisation==true) normalisation = false;
  //  else if (normalisation==false) normalisation = true; 
  //}
  
  //if (key == 'c' || key == 'C') {
  //  if (colorSwitch==true) colorSwitch = false;
  //  else if (colorSwitch==false) colorSwitch = true; 
  //}
  
  if (key == 'd' || key == 's' || key == 'c' || key == 'f' ) { 
    // bead_type 1 is default (dot spiral)
    // set new bead_type
    if (key == 'd') bead_type = 1;
    if (key == 's') bead_type = 2;
    if (key == 'c') bead_type = 3;
    if (key == 'f') bead_type = 4;
  }
  
  if (key == '2') {
    if (nCs>=2){
    if (cSwitch[1]==true) cSwitch[1] = false;
    else if (cSwitch[1]==false) cSwitch[1] = true;
    }
  }
  if (key == '3') {
    if (nCs>=3){
    if (cSwitch[2]==true) cSwitch[2] = false;
    else if (cSwitch[2]==false) cSwitch[2] = true;
    }
  }
  if (key == '4') {
    if (nCs>=4){
    if (cSwitch[3]==true) cSwitch[3] = false;
    else if (cSwitch[3]==false) cSwitch[3] = true;
    }
  }
  if (key == '1') {
    if (nCs>=1){
    if (cSwitch[0]==true) cSwitch[0] = false;
    else if (cSwitch[0]==false) cSwitch[0] = true;
    }
  }
  if (key == '5') {
    if (nCs>=5){
    if (cSwitch[4]==true) cSwitch[4] = false;
    else if (cSwitch[4]==false) cSwitch[4] = true;
    }
  }
  if (key == '6') {
    if (nCs>=6){
    if (cSwitch[5]==true) cSwitch[5] = false;
    else if (cSwitch[5]==false) cSwitch[5] = true;
    }
  }
  
  // set camera modes
  if (key == 'r' || key == 'h' || key == ' ') { 
    // bead_type 1 is default (dot spiral)
    // set new bead_type
    if (key == 'r') { // road view
      cam.reset(0);   // immediate reset
      cam.setRotations(radians(30),0,0); // pitch up for angled view
      cam.setPitchRotationMode();  // allow pitch rotation only
      //cam.setSuppressRollRotationMode();
    }
    if (key == 'h') {
      bead_type = 2;
      cam.reset(0);
      cam.setRotations(PI/2,0,PI);
    }; // hanging
    if (key == ' ') cam.setFreeRotationMode(); // unrestrict
  }
  
}




//// mouse position: resets overGrid, 
//// sets locaton vars mYear, mDewey, mCountry
//void parseMouseLocation(int x, int y) {
  
//  // over grid?
//  if (x>constantHorizontalMargin && x<(width-constantHorizontalMargin) &&
//      y>constantVerticalMargin && y<(height-constantVerticalMargin+cellHeight)) {
//      overGrid = true;
//      // which box?
//      mCountry = floor((x-constantHorizontalMargin)/cellWidth);
//      offsetY = y-constantVerticalMargin-cellHeight;
//      if (offsetY < 0) offsetY = 0;
//      mDewey = floor(offsetY/(cellHeight*(noYears+1)))*10 + 
//               dewey_code*100;
//      mYear = floor(offsetY/cellHeight)%(noYears+1) + startYear;
//  }
//  else if (x<=constantHorizontalMargin || x>=(width-constantHorizontalMargin) ||
//           y<=constantVerticalMargin || y>=(height-constantVerticalMargin+cellHeight)) {
//    overGrid = false;
//  }
  
//}