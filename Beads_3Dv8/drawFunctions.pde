//void drawSlice(float rScale, float[] tRadii, float[] bRadii, float sliceHeight, float beadMax, float hue)
//{
//    int sides = tRadii.length;
//    float angle = 360 / sides;
//    float halfHeight = sliceHeight / 2;
//    float tMax = max1D(tRadii);
//    if (tMax==0) tMax = 1;
//    float bMax = max1D(bRadii);
//    if (bMax==0) bMax = 1;
//    //float tMax = beadMax;
//    //float bMax = beadMax;
//    // top
//    beginShape();
//    for (int i = 0; i < sides; i++) {
//      float dvalT = ;
//      if (beadMax>0) {
//        //float radmapT = map(tRadii[i % sides],0,beadMax,radMin,radMax);
//        float satmapT = map(tRadii[i % sides],0,beadMax,satMin,satMax);
//        float brimapT = map(tRadii[i % sides],0,beadMax,briMin,briMax);
//        float x = cos( radians( i * angle ) ) * log(dvalT+1) * rScale;
//        float y = sin( radians( i * angle ) ) * log(dvalT+1) * rScale;        
//        stroke(hue,satmapT,brimapT);
//        fill(hue,satmapT,brimapT);
//        vertex( x, y, -halfHeight);
//      }
//      else {
//        stroke(hue,0,0);
//        fill(hue,0,0);
//        vertex(0,0,-halfHeight);
//      }
//    }
//    endShape(CLOSE);
    
//    // bottom
//    beginShape();
//    for (int i = 0; i < sides; i++) {
//      if (beadMax>0) {
//        float radmapB = map(bRadii[i % sides],0,beadMax,radMin,radMax);
//        float satmapB = map(bRadii[i % sides],0,beadMax,satMin,satMax);
//        float brimapB = map(bRadii[i % sides],0,beadMax,briMin,briMax);
//        float x = cos( radians( i * angle ) ) * log(radmapB) * rScale;
//        float y = sin( radians( i * angle ) ) * log(radmapB) * rScale;
//        stroke(hue,satmapB,brimapB);
//        strokeWeight(2);
//        fill(hue,satmapB,brimapB);
//        vertex( x, y, halfHeight);
//      }
//      else {
//        stroke(hue,0,0);
//        fill(hue,0,0);
//        vertex(0,0, halfHeight);
//      }
//    }
//    endShape(CLOSE);
    
//    // draw body
//    beginShape(TRIANGLE_STRIP);
//    for (int i = 0; i < sides + 1; i++) {
//      if (beadMax>0) {
//        float radmapT = map(tRadii[i % sides],0,beadMax,radMin,radMax);
//        float radmapB = map(bRadii[i % sides],0,beadMax,radMin,radMax);
//        float satmapM = max(map(tRadii[i % sides],0,beadMax,satMin,satMax), map(bRadii[i % sides],0,beadMax,satMin,satMax));
//        float brimapM = max(map(tRadii[i % sides],0,beadMax,briMin,briMax), map(bRadii[i % sides],0,beadMax,briMin,briMax));
//        float x1 = cos( radians( i * angle ) ) * log(radmapT) * rScale;
//        float y1 = sin( radians( i * angle ) ) * log(radmapT) * rScale;
//        float x2 = cos( radians( i * angle ) ) * log(radmapB) * rScale;
//        float y2 = sin( radians( i * angle ) ) * log(radmapB) * rScale;
//        stroke(hue,satmapM,brimapM);
//        strokeWeight(2);
//        fill(hue,satmapM,brimapM);
//        vertex( x1, y1, -halfHeight);
//        vertex( x2, y2, halfHeight);
//      }
//      else {
//        stroke(hue,0,0);
//        fill(hue,0,0);
//        vertex(0,0,-halfHeight);
//        vertex(0,0, halfHeight);
//      }
//    }
//    endShape(CLOSE);
//} 

//void drawDotSpiral(float rScale, float[] tRadii, float sliceHeight, float beadMax, float dotHeight, float hue)
//{
//    int dots = tRadii.length;
//    float angle = 360 / dots;
//    float halfHeight = sliceHeight / 2;
//    float tMax = max1D(tRadii);
//    if (tMax==0) tMax = 1;
//    //float tMax = beadMax;
//    //if (beadMax==0) beadMax = 1;

//    // draw a point spiral (one rotation)
//    for (int i = 0; i < dots; i++) {
//      if (beadMax>0) {
//        float radmap = map(tRadii[i],0,beadMax,radMin,radMax);
//        float satmap = map(tRadii[i],0,beadMax,satMin,satMax);
//        float brimap = map(tRadii[i],0,beadMax,briMin,briMax);
//        float x = cos( radians( i * angle ) ) * log(radmap) * rScale;
//        float y = sin( radians( i * angle ) ) * log(radmap) * rScale;
//        stroke(hue,satmap,brimap);
//        strokeWeight(2);
//        point(x, y, halfHeight - dotHeight*i);
//      }
//      else {
//        stroke(hue,0,0);
//        strokeWeight(2);
//        point(0, 0, halfHeight - dotHeight*i);
//      }
//    }
//} 

//void drawLineSpiral(float rScale, float[] tRadii, float sliceHeight, float beadMax, float dotHeight, float hue)
//{
//    int dots = tRadii.length;
//    float angle = 360 / dots;
//    float halfHeight = sliceHeight / 2;
//    float tMax = max1D(tRadii);
//    //float tMax = beadMax;
//    if (tMax==0) tMax = 1;
//    //float tMax = beadMax;

//    // draw a point spiral (one rotation)
//    beginShape();
//    for (int i = 0; i < dots; i++) {
//      if (beadMax>0) {
//        float radmap = map(tRadii[i],0,beadMax,radMin,radMax);
//        float satmap = map(tRadii[i],0,beadMax,satMin,satMax);
//        float brimap = map(tRadii[i],0,beadMax,briMin,briMax);
//        float x = cos( radians( i * angle ) ) * log(radmap) * rScale;
//        float y = sin( radians( i * angle ) ) * log(radmap) * rScale;
//        stroke(hue,satmap,brimap);
//        strokeWeight(2);
//        noFill();
//        vertex(x, y, halfHeight - dotHeight*i);
//      }
//      else {
//        stroke(hue,0,0);
//        strokeWeight(2);
//        point(0, 0, halfHeight - dotHeight*i);
//      }
//    }
//    endShape(OPEN);
//} 

//void drawDisc(float rScale, float[] tRadii, float sliceHeight, float beadMax, float hue)
//{
//    int dots = tRadii.length;
//    float angle = 360 / dots;
//    float halfHeight = sliceHeight / 2;
//    float tMax = max1D(tRadii);
//    //float tMax = beadMax;
//    if (tMax==0) tMax = 1;

//    // draw a point disc (one rotation)
//    beginShape();
//    for (int i = 0; i < dots; i++) {
//      if (beadMax>0) {
//        float radmap = map(tRadii[i],0,overallMax,radMin,radMax);
//        float satmap = map(tRadii[i],0,overallMax,satMin,satMax);
//        float brimap = map(tRadii[i],0,overallMax,briMin,briMax);
//        float x = cos( radians( i * angle ) ) * log(radmap) * rScale;
//        float y = sin( radians( i * angle ) ) * log(radmap) * rScale;
//        stroke(hue,satmap,brimap);
//        strokeWeight(2);
//        fill(hue,satmap,brimap);
//        vertex(x, y, halfHeight);
//      }
//      else {
//        stroke(hue,0,0);
//        strokeWeight(2);
//        point(0, 0, halfHeight);
//      }
//    }
//    endShape(CLOSE);
//} 