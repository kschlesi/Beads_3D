void iDisplay(){
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
 
  //Title
    fill(0,0,80);
    textAlign(LEFT,CENTER);
    textSize(40);
    text("International SPL", -width/2+60, -height/2+50);
    
  // Country key
    for (int c=0; c<nCs; c++){
      if (cSwitch[c]) { 
        textSize(20);
        pushMatrix();
        translate(-width/2+lM, -25*nCs/2+10+(c * 25), 0);
        stroke(countryHue(countryName(c)),0,0);
        fill(countryHue(countryName(c)),90,85);
        text(countryName(c),0,0);
        popMatrix();
      }
    }
    
  // interaction key 
    textSize(14);
    textAlign(LEFT);
    fill(0,0,80);
    text("K Schlesinger | MAT 259 3D Project",-width/2+lM,-height/2+100);
    text("Data from Seattle Public Library",-width/2+lM,-height/2+100+tS);
    pushMatrix();
    translate(-width/2+lM, -height/2+150); //750
    text("Press [d] for dots and [s] for spirals",0,0*tS);
    text("Press [1-" + nCs + "] to toggle data for each country",0,1*tS);
    text("Press [m] and [t] to toggle mouseover text and dates",0,2*tS);
    text("Press [h] for hanging view and [r] for top view",0,3*tS);
    text("Press [space] to allow free rotation", 0,4*tS);
    text("Press [i] to toggle text interface",0,5*tS);
    text("Press [l] to toggle labels",0,6*tS);
    popMatrix();
    
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void mDisplay() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();

  // mouseover text
    if (dispTxt==true) {
      fill(0,0,80);
      textSize(14);
      textAlign(RIGHT);
      text(theTxt,width/2-lM,-height/2+100);
    }
    
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}