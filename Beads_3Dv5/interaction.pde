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
  
  if (key == '1' || key == '2' || key == '3' || key == '4' ) { 
    // bead_type 1 is default (dot spiral)
    // set new bead_type
    if (key == '1') bead_type = 1;
    if (key == '2') bead_type = 2;
    if (key == '3') bead_type = 3;
    if (key == '4') bead_type = 4;
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