void iDisplay(){
  perspective();
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
 
  //Title
    fill(0,0,80);
    textAlign(LEFT);
    textSize(60);
    text("International SPL", -width+200, -height+150);
    
  // Country key
    for (int c=0; c<nCs; c++){
      if (cSwitch[c]) { 
        textSize(35);
        pushMatrix();
        translate(-width+300, -height+550+(c * 45), 0);
        stroke(countryHue(countryName(c)),0,0);
        fill(countryHue(countryName(c)),90,85);
        text(countryName(c),0,0);
        popMatrix();
      }
    }
    
  // interaction key 
    textSize(25);
    textAlign(LEFT);
    fill(0,0,80);
    text("K Schlesinger, MAT 259 3D Project",-width+250,-height+200);
    text("Data from Seattle Public Library",-width+250,-height+230);
    pushMatrix();
    translate(-width+250, -height+280); //750
    text("Press [d] for dots and [s] for spirals",0,0);
    text("Press [1-" + nCs + "] to toggle data for each country",0,30);
    text("Press [h] for hanging view and [r] for top view",0,60);
    text("Press [space] for free rotation", 0,90);
    text("Press [i] to toggle text interface",0,120);
    text("Press [l] to toggle labels",0,150);
    popMatrix();
    
  // mouseover text
    //println(dispTxt);
    if (dispTxt==true) {
      fill(0,0,80);
      textSize(30);
      textAlign(RIGHT);
      text(theTxt,0,-height+200);
    }
    
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}