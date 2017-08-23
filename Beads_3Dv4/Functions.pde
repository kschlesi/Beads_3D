float sbMin = 45;
float sbMax = 99;

void drawSlice(float rTop, float rBottom, float[] tRadii, float[] bRadii, float sliceHeight, float beadMax, float hue)
{
    int sides = tRadii.length;
    float angle = 360 / sides;
    float halfHeight = sliceHeight / 2;
    //float tMax = max1D(tRadii);
    //if (tMax==0) tMax = 1;
    //float bMax = max1D(bRadii);
    //if (bMax==0) bMax = 1;
    float tMax = beadMax;
    float bMax = beadMax;
    // top
    beginShape();
    for (int i = 0; i < sides; i++) {
      if (i>=sides) println(i + " " + str(i % sides) + "top");
        float radT = rTop * tRadii[i % sides] / tMax;
        float radmapT = map(radT,0,beadMax,sbMin,sbMax);
        float x = cos( radians( i * angle ) ) * radT;
        float y = sin( radians( i * angle ) ) * radT;
        stroke(hue,radmapT,radmapT);
        fill(hue,radmapT,radmapT);
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);
    // bottom
    beginShape();
    for (int i = 0; i < sides; i++) {
      if (i>=sides) println(i + " " + str(i % sides) + "bot");
        float radB = rBottom * bRadii[i % sides] / bMax;
        float radmapB = map(radB,0,beadMax,sbMin,sbMax);
        float x = cos( radians( i * angle ) ) * radB;
        float y = sin( radians( i * angle ) ) * radB;
        stroke(hue,radmapB,radmapB);
        strokeWeight(2);
        fill(hue,radmapB,radmapB);
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    // draw body
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
      if (i>=sides) println(i + " " + str(i % sides) + "mid");
        float radT = rTop * tRadii[i % sides] / tMax;
        float radB = rBottom * bRadii[i % sides] / bMax;
        float radmapB = max(map(radT,0,beadMax,sbMin,sbMax), map(radB,0,beadMax,1,99));
        float x1 = cos( radians( i * angle ) ) * radT;
        float y1 = sin( radians( i * angle ) ) * radT;
        float x2 = cos( radians( i * angle ) ) * radB;
        float y2 = sin( radians( i * angle ) ) * radB;
        stroke(hue,radmapB,radmapB);
        strokeWeight(2);
        fill(hue,radmapB,radmapB);
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);
    }
    endShape(CLOSE);
} 

void drawDotSpiral(float rScale, float[] tRadii, float sliceHeight, float beadMax, float dotHeight, float hue)
{
    int dots = tRadii.length;
    float angle = 360 / dots;
    float halfHeight = sliceHeight / 2;
    if (beadMax==0) beadMax = 1;

    // draw a point spiral (one rotation)
    for (int i = 0; i < dots; i++) {
        float rad = rScale * tRadii[i] / beadMax;
        float radmap = map(rad,0,beadMax,sbMin,sbMax);
        float x = cos( radians( i * angle ) ) * rad;
        float y = sin( radians( i * angle ) ) * rad;
        stroke(hue,radmap,radmap);
        strokeWeight(2);
        //println("dotx = " + cos( radians( i * angle ) ) + " * " + rScale + " * " + tRadii[i] + " / " + beadMax);
        point(x, y, halfHeight - dotHeight*i);
    }
} 

void drawLineSpiral(float rScale, float[] tRadii, float sliceHeight, float beadMax, float dotHeight, float hue)
{
    int dots = tRadii.length;
    float angle = 360 / dots;
    float halfHeight = sliceHeight / 2;
    if (beadMax==0) beadMax = 1;

    // draw a point spiral (one rotation)
    beginShape();
    for (int i = 0; i < dots; i++) {
        float rad = rScale * tRadii[i] / beadMax;
        float radmap = map(rad,0,beadMax,sbMin,sbMax);
        float x = cos( radians( i * angle ) ) * rad;
        float y = sin( radians( i * angle ) ) * rad;
        stroke(hue,radmap,radmap);
        strokeWeight(2);
        vertex(x, y, halfHeight - dotHeight*i);
    }
    endShape(OPEN);
} 

void drawDisc(float rScale, float[] tRadii, float sliceHeight, float beadMax, float hue)
{
    int dots = tRadii.length;
    float angle = 360 / dots;
    float halfHeight = sliceHeight / 2;

    // draw a point disc (one rotation)
    beginShape();
    for (int i = 0; i < dots; i++) {
        float rad = rScale * tRadii[i] / beadMax;
        float radmap = map(rad,0,beadMax,sbMin,sbMax);
        float x = cos( radians( i * angle ) ) * rad;
        float y = sin( radians( i * angle ) ) * rad;
        stroke(hue,radmap,radmap);
        strokeWeight(2);
        vertex(x, y, halfHeight);
    }
    endShape(CLOSE);
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
    case "Mexico": hue = 0;
                   return hue;
    case "Ireland": hue = 45;
                    return hue;
    case "Egypt": hue = 0;
                  return hue;
    case "Japan": hue = 100;
                  return hue;
    case "Cuba": hue = 0;
                 return hue;
    case "Germany": hue = 0;
                    return hue;
    case "Iraq": hue = 300;
                 return hue;
    case "Vietnam": hue = 0;
                    return hue;
    case "Israel": hue = 200;
                   return hue;
    default: return hue;
  }
}