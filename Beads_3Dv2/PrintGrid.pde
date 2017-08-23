void printGrid(float[][] theMatrix) {
  float constantHorizontalMargin = 160;
  float constantVerticalMargin = 100;
  
  int numColumns = theMatrix[0].length;
  int numRows = theMatrix.length;
  float cellWidth = (width - constantHorizontalMargin*2)/(numColumns);
  float cellHeight = (height - constantVerticalMargin*2)/numRows;
  float maxValue = max2D(theMatrix);
  float minValue = min2D(theMatrix);
  
  for(int i=0; i<numColumns; i++){
    for(int j=0; j<numRows; j++){
      stroke(255);
      strokeWeight(1);
      float greyScale = map(theMatrix[j][i], minValue, maxValue, 230, 0);
      fill(greyScale);
      rect(constantHorizontalMargin + cellWidth*i, 
           constantVerticalMargin + cellHeight*j, cellWidth, cellHeight);
    }
  }
}