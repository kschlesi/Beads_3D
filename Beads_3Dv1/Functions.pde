void drawSlice(float rTop, float rBottom, float[] tRadii, float[] bRadii, float sliceHeight, float beadMax)
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
        float x = cos( radians( i * angle ) ) * rTop * tRadii[i % sides] / tMax;
        float y = sin( radians( i * angle ) ) * rTop * tRadii[i % sides] / tMax;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);
    // bottom
    beginShape();
    for (int i = 0; i < sides; i++) {
      if (i>=sides) println(i + " " + str(i % sides) + "bot");
        float x = cos( radians( i * angle ) ) * rBottom * bRadii[i % sides] / bMax;
        float y = sin( radians( i * angle ) ) * rBottom * bRadii[i % sides] / bMax;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    // draw body
    //beginShape(TRIANGLE_STRIP);
    //for (int i = 0; i < sides + 1; i++) {
    //  if (i>=sides) println(i + " " + str(i % sides) + "mid");
    //    float x1 = cos( radians( i * angle ) ) * rTop * tRadii[i % sides] / tMax;
    //    float y1 = sin( radians( i * angle ) ) * rTop * tRadii[i % sides] / tMax;
    //    float x2 = cos( radians( i * angle ) ) * rBottom * bRadii[i % sides] / bMax;
    //    float y2 = sin( radians( i * angle ) ) * rBottom * bRadii[i % sides] / bMax;
    //    vertex( x1, y1, -halfHeight);
    //    vertex( x2, y2, halfHeight);
    //}
    //endShape(CLOSE);
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