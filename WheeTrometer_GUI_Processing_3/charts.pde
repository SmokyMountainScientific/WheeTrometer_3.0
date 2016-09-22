void charts_grafica_setup(){
  
              ////////////////////////////////gicentre charts///
  plot2 = new GPlot(this);
  //plot2.setPos(new float[] {260, 200});
  //plot2.setDim(new float[] {250, 250});
  plot2.getXAxis().getAxisLabel().setText("Wavelength (nm)");
  plot2.getYAxis().getAxisLabel().setText("Absorbance/Transmitance");
  plot2.getTitle().setText("WheeTrometer");
  //plot2.setXLim(new float[] {400, 900});
  plot2.setXLim(min(wavelength), max(wavelength));
  print(wavelength);
  plot2.setYLim(new float[] {0, 800});
  plot2.setPoints(data);
    //for(int i = 1; i<19;i++){
     // plot2.addLayer("layer_"+str(i),newdata);
   // }
  for(int i = 0; i<768; i++){
  data.add(i,i);
  }
  
}/////////////////////////////////////////////////end charts_gic_setup///////////////////////////////////////////////