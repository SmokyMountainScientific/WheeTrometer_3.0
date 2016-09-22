    private class SecondApplet extends PApplet{ 
                                                                        ////getPointAt(float xScreen, float yScreen)
  void setup()
  {
    background(0, 0, 0);
    size(550,500);
    PFont font = createFont("SansSerif",16);
    textFont(font, 16);
    smooth();
    textAlign(CENTER,CENTER);
    fill(20,120,20);
    //win.setResizable(true);
    
  cp5b = new ControlP5(this);  
   cp5b.addBang("Integrate")
    .setColorBackground(#FFFEFC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(#AA8A16)
          .setColorActive(#06CB49)
            .setPosition(20, 20)
              .setSize(130, 30)
                .setTriggerEvent(Bang.RELEASE)
                  .setLabel("integrate") //
                    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                      ;

    
  plot1 = new GPlot(this);
  plot1.setPos(new float[] {20, 80});
  //plot1.setDim(new float[] {50, 50});
  plot1.getXAxis().getAxisLabel().setText("mouseX");
  plot1.getYAxis().getAxisLabel().setText("-mouseY");
  plot1.getTitle().setText("Mouse position");
  plot1.setPoints(data);
  //plot1.addLayer("hello",points1b);
  }

  // ----------------------- Processing draw --------------------------
  
  // Displays some text and animates a change in size.
  void draw()
  {
    //super.draw();   // Should be the first line of draw().
    try{
    background(200,255,200);
   if(Modetorun != null){
    if(Modetorun.equals("Absorbance") || Modetorun.equals("Transmitance")){
     // int npoints = data.getNPoints();
    //if(npoints != -1){
      // adjust max and min on chart and put new datat here
   // }
    }
  }  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   /* pushMatrix();
    translate(40,height/2);
    rotate(1.570796327);
    text("Current (relative)", 0, 0); 
    popMatrix(); */
   if(winshow==true){
   plot1.beginDraw();
   float wdth = width-140;
   float hgt = height-300;
    plot1.setDim(wdth, hgt);
    plot1.drawBackground();
    plot1.drawBox();
    plot1.drawXAxis();
    plot1.drawYAxis();
    plot1.drawTitle();
    //plot1.drawGridLines(GPlot.BOTH);
    plot1.setPoints(data);
    plot1.drawLines();
    plot1.drawPoints();
  plot1.endDraw();
   }
    }
    catch(Exception e){
    println("integration window");
    }
   
     if(mousest == true){
   //win.setVisible(false);
    if(nxtpt == false){
      start_point();
    }
    if(nxtpt == true){
    second_point();    
  }

  }
  if (XY1 != null && XY2 != null) {
    Gbaseline = new GPointsArray(2);
    Gbaseline.add(XY1.x,XY1.y);
    Gbaseline.add(XY2.x,XY2.y);
    if(plot1.getLayer("layer_1") == null){
      plot1.addLayer("layer_1",Gbaseline);
    }
    else{
    plot1.getLayer("layer_1").setPoints(Gbaseline); 
    //plot1.getLayer("layer_1").setPoints(XY1,XY2);
     // adjust new data to fit old data on graph
    }
  }
 
  }//////////end draw/////////////////////////////////////////////////*********//////////////////////////////////////////////

void integrate(){
mousest = true;
println("mousest "+mousest);
}

void integdata() { //public void integdata() {
  area = 0;
  int indx1 = pvector_dat.indexOf(XY1);
  int indx2 = pvector_dat.indexOf(XY2);
  println("indx1 "+indx1);
  int bounds = abs(indx1-indx2);
  println("bounds "+bounds);
  if(indx1 < indx2){
  for (int i = indx1+1; i < indx2+1; i++) {
    PVector Xi = (PVector) pvector_dat.get(i);
    PVector Xi2 = (PVector) pvector_dat.get(i-1);
    area += (Xi.x - Xi2.x) * (Xi.y + Xi2.y);
  }
  }
  else{
      for (int i = indx2+1; i < indx1+1; i++) {
    PVector Xi = (PVector) pvector_dat.get(i);
    PVector Xi2 = (PVector) pvector_dat.get(i-1);
    area += (Xi.x - Xi2.x) * (Xi.y + Xi2.y);
  }
  }
  area = abs(area)*0.5;
  println("area1 "+area);
  baseline();
  peak_height();
  area = area - areabase;
  println("peak height "+peakheight);
  println("ar2 "+area);
}

void baseline(){ //public void baseline(){/////////////////////////////////////////////////////////////////
  areabase = 0;
  int indxb1 = pvector_dat.indexOf(XY1);
  int indxb2 = pvector_dat.indexOf(XY2);
  PVector Xbi = (PVector) pvector_dat.get(indxb1);
  PVector Xbi2 = (PVector) pvector_dat.get(indxb2);
if(indxb1 > indxb2){
areabase += (Xbi.x - Xbi2.x) * (Xbi.y + Xbi2.y);
}
else{
areabase += (Xbi2.x - Xbi.x) * (Xbi2.y + Xbi.y);
}
areabase = 0.5*abs(areabase);
println("ar_b "+areabase);
}

void peak_height(){ ////////////////////////////////////////////////////////////////////////////////////////////////
 peaktest = 0;
 peakheight = 0;
 int indx1 = pvector_dat.indexOf(XY1);
 int indx2 = pvector_dat.indexOf(XY2);
   if(indx1 < indx2){
      PVector Xi = (PVector) pvector_dat.get(indx1);
      peakheight = Xi.y;
      for (int i = indx1; i <= indx2; i++) { // for (int i = indx1+1; i < indx2+1; i++) {
        Xi = (PVector) pvector_dat.get(i);
        peaktest = Xi.y;
        if(peakheight < peaktest){
          peakheight = peaktest;
          println("indxx "+i);
        }
      }
   }
  else{
      PVector Xi = (PVector) pvector_dat.get(indx2);
      peakheight = Xi.y;
    for (int i = indx2; i <= indx1; i++) { //for (int i = indx2+1; i < indx1+1; i++) {
        Xi = (PVector) pvector_dat.get(i);
        peaktest = Xi.y;
        if(peakheight < peaktest){
          peakheight = peaktest;
        }
    }
  }
}

void start_point() { //public void start_point() {//////////////////////////////////////////////////////////////////
  delay(20);
  try {
      if(mousePressed==true){
       if (mouseX >= 0 && mouseX <= width) {  //if (mouseX >= lspc && mouseX <= rspc) {  //if (mouseX >= 20 && mouseX <= wdth-20)
           if (mouseY >= 0 && mouseY <= height) {//   if (mouseY >= tpspc && mouseY <= btmspc) {  //if (mouseY >= 52 && mouseY <= higt-20) {
              float [] mousefloat = {0,0};
              mousefloat = plot1.getValueAt(mouseX, mouseY); // PVector mouseData = lineChart.getScreenToData(new PVector(mouseX, mouseY));  //getRelativePlotPosAt
              PVector mouseData = new PVector(mousefloat[0], mousefloat[1]);
              println(mouseData);
              bx1 = mouseX;
              by1 = mouseY;
              pvector_creat();
              XY1 = getClosestPoint(mouseData, pvector_dat);
              println("initial pt "+XY1);
            }
        }
        nxtpt = true;
      }
  }
  catch(Exception e){
/*   warning.show();
   warningtxt.setText("Mouse outside of graph bounds");  
  println("Mouse outside of graph bounds");*/
  }
}
void second_point(){//////////////////////////////////////////////////////////////////////////////////////////////////////
  try {
      if(mousePressed == false && nxtpt == true) {
        if (mouseX >= 0 && mouseX <= width) {   //if (mouseX >= 20 && mouseX <= wdth-20) {
         if (mouseY >= 0 && mouseY <= height) {  //if (mouseY >= 50 && mouseY <= higt-20) {
            //PVector mouseData = win1Chart.getScreenToData(new PVector(mouseX, mouseY)); // PVector mouseData = lineChart.getScreenToData(new PVector(mouseX, mouseY));
            float [] mousefloat = {0,0};
            mousefloat = plot1.getValueAt(mouseX, mouseY); // PVector mouseData = lineChart.getScreenToData(new PVector(mouseX, mouseY));
            PVector mouseData = new PVector(mousefloat[0], mousefloat[1]);
            pvector_creat();
            XY2 = getClosestPoint(mouseData, pvector_dat);
            println("fnl pt "+XY2);
            /////
      
            float[] fitx = {XY1.x, XY2.x};
            float[] fity = {XY1.y, XY2.y};
            println("fit "+XY1.x);
            integration_data.add(fitx,fity);
            //integChart.setData(fitx, fity);
            //integChart.showXAxis(true); 
            //integChart.showYAxis(true);
            
            
            integdata();
          }
        }
        nxtpt = false;
      }
  }
  catch (Exception e){
 //  warning.show();
//   warningtxt.setText("Mouse outside of graph bounds");      
   println("Mouse outside of graph bounds");
  }
}

void pvector_creat() {/////////////////////////////////////////////////////////////////////////////////////////////
  //float[] Xdat = win1Chart.getXData();//  float[] Xdat = lineChart.getXData();
  //float[] Ydat = win1Chart.getYData();//  float[] Ydat = lineChart.getYData();
  GPointsArray XYdat = plot1.getPoints();
  for (int i=0; i< XYdat.getNPoints(); i++) {
    pvector_dat.add(new PVector(XYdat.getX(i), XYdat.getY(i), 0));
  }
}

// A function that returns the closest point from a set
PVector getClosestPoint(PVector TESTPT, ArrayList PTS) { ////////////////////////////////////////////////////////////////

  // some impossibly high distance (ie something is always closer)
  float distClosest = 999999;
  // the closest point
  PVector theClosestPt = null;
  // Loop to find the closest point
  for (int i = 0; i<PTS.size(); ++i) {
    // get a object
    PVector testPos = (PVector) PTS.get(i);
    // get the distance
    float d2 = PVector.dist(TESTPT, testPos);
    // ask the question
    if (d2 < distClosest) {
      // update the closest distance
      distClosest = d2;
      // remember the closest pos
      theClosestPt = testPos.get();
    }
  }

  // return the closest point
  //println("the closest pt  "+theClosestPt);
  return theClosestPt;
}


}///////////////////////////end extra window//////////////////////////////////////////////////////////////////////////////////////////////////////////////////