void setHangingView() {
  lSwitch = true; // labels on
  cam.reset(0);   // positioning
  cam.setRotations(PI/2,0,PI);
  cam.pan(colSpacing/2,250);
  cam.setPitchRotationMode(); // allow pitch rotation only
}

void setRoadView() {
      lSwitch = true; // labels on
      cam.reset(0);   // immediate reset
      cam.setRotations(radians(30),0,0); // pitch up for angled view
      cam.setPitchRotationMode();  // allow pitch rotation only
      cam.setDistance(600);
      cam.pan(0,-height/4); 
}

// given a 1D array, returns maximum value in array
float max1D(float[] array1D) {
  float max = 0;
  for (int i=0; i < array1D.length; i++ ) {
      if (array1D[i]>max) {
        max = array1D[i];
      }
  }
  return max;
}

// given a 1D array, returns minimum value in array
float min1D(float[] array1D) {
  float min = max1D(array1D);        // calls max2D
  for (int i=0; i < array1D.length; i++ ) {
      if (array1D[i]<min) {
        min = array1D[i];
      }
  }
  return min;
}


// given a 2D array, returns maximum value in array
float max2D(float[][] array2D) {
  float max = 0;
  for (int i =0; i < array2D.length; i++ ) {
    for ( int j =0; j < array2D[i].length; j++) {
      if (array2D[i][j]>max) {
        max = array2D[i][j];
      }
    }
  }
  return max;
}

// given a 2D array, returns minimum value in array
float min2D(float[][] array2D) {
  float min = max2D(array2D);        // calls max2D
  for (int i =0; i < array2D.length; i++ ) {
    for ( int j =0; j < array2D[i].length; j++) {
      if (array2D[i][j]<min) {
        min = array2D[i][j];
      }
    }
  }
  return min;
}

float countryHue(String cName) {
  // finds hue (0-359) based on country name
  float hue = 0;
  switch (cName) {
    case "China": hue = 0;
                  return hue;
    case "Ireland": hue = 65;
                    return hue;
    case "Japan": hue = 100;
                  return hue;
    case "Cuba": hue = 300;
                 return hue;
    case "Israel": hue = 200;
                   return hue;
    case "Spain": hue = 30;
                   return hue;
    default: return hue;
  }
}

String countryName(int c) {
  switch(c) {
    case 0: cName = "China";
    break;
    case 1: cName = "Ireland";
    break;
    case 2: cName = "Israel";
    break;
    case 3: cName = "Spain";
    break;
    case 4: cName = "Japan";
    break;
    default: cName = "Cuba";
    break;
  }
  return cName;
}