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

String deweyRegExp(int dClass) {
// gives string reg exp for dewey class
  String deweyClass;
  String deweyRegExp;
  
  switch(dClass){
    case 1: deweyClass = "100";
            deweyRegExp = "1..";
            //deweyTitle = "Philosophy & psychology";
            break;
    case 2: deweyClass = "200";
            deweyRegExp = "2..";
            //deweyTitle = "Religion";
            break;
    case 3: deweyClass = "300";
            deweyRegExp = "3..";
            //deweyTitle = "Social sciences & politics";
            break;
    case 4: deweyClass = "400";
            deweyRegExp = "4..";
            //deweyTitle = "Languages";
            break;
    case 5: deweyClass = "500";
            deweyRegExp = "5..";
            //deweyTitle = "Science";
            break;
    case 6: deweyClass = "600";
            deweyRegExp = "6..";
            //deweyTitle = "Technology";
            break;
    case 7: deweyClass = "700";
            deweyRegExp = "7..";
            //deweyTitle = "Arts & recreation";
            break;
    case 8: deweyClass = "800";
            deweyRegExp = "8..";
            //deweyTitle = "Literature";
            break;
    case 9: deweyClass = "900"; // dewey level 900 is default
            deweyRegExp = "9..";
            //deweyTitle = "History & geography";
            break;
    case 0: deweyClass = "000";
            deweyRegExp = "^[0-9]?0$";
            //deweyTitle = "Computer science & information";
            break;
    default: deweyRegExp = "900";
             deweyClass = "9.."; 
  }
  return deweyRegExp;
}