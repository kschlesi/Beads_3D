float offsetY;

void keyPressed()
{
  // label toggle
  if (key == 'l' || key == 'L') {
    if (lSwitch==true) lSwitch = false;
    else if (lSwitch==false) lSwitch = true; 
  }
  
  // mouseover text toggle
    if (key == 'm' || key == 'M') {
    if (mSwitch==true) mSwitch = false;
    else if (mSwitch==false) mSwitch = true; 
  }
  
  // mouseover bead time labels toggle
  if (key == 't' || key == 'T') {
    if (tLabels==true) tLabels = false;
    else if (tLabels==false) {
      tLabels = true;
    }
  }
  
  // instruction text toggle
  if (key == 'i' || key == 'I') {
    if (iSwitch==true) iSwitch = false;
    else if (iSwitch==false) iSwitch = true; 
  }
  
  // turn countries on and off
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
    if (key == 'r') { // road view
      setRoadView();
    }
    if (key == 'h') { // hanging view
      setHangingView();
    }; 
    if (key == ' ') cam.setFreeRotationMode(); // unrestrict
  
}