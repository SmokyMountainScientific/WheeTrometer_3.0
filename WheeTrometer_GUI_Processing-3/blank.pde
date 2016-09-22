void graph_data(){
  
  if(dataraw.length>=768){
        if (Modetorun=="Absorbance" || Modetorun=="Series"){// && blank.length <= dataraw.length  && runblank == false) {
          if(blank.length <= dataraw.length  && runblank == false) {
            for(int j=0;j<blank.length;j++){
              dataraw[j] = -(log(dataraw[j]/blank[j])/log(10));
            }
            for(int j=0;j<blank.length;j++){
              if(dataraw[j] != dataraw[j]){                           // test for NaN in array
                dataraw[j] = 0;
              } 
            }
            //println(dataraw);
          }
        }
        if (overlaydata == true || Modetorun=="Series"){                    // increase variable numrun for each run if doing series or overlay
          numrun++;
        }
        if(runblank == true){
          blank = dataraw;
            for(int k = 0; k < dataraw.length; k++){
              logData(dataPath(blankfile), trim(str(blank[k]))+",", true);
            }
          runblank = false;
        }
        for(int j = 0; j<wavelength.length; j++){                        // add points to array to be plotted
            //data.setXY(j,j,dataraw[j]);
            data.add(wavelength[j],dataraw[j]);
        }
        data.removeInvalidPoints();
       // float[] yscale = new float[2];
        if (overlaydata == true || Modetorun=="Series"){              // only adjust scale for multiple scans if new min or max
          if(min(dataraw) < yscale[0]){
            yscale[0] = min(dataraw);
          }
          if(max(dataraw) > yscale[1]){
            yscale[1] = max(dataraw);
          }
        }
        else{                                                          // if only single scan adjust min and max for each spectra
        yscale[0] = min(dataraw);
        yscale[1] = max(dataraw);
        }
        //plot2.setXLim(new float[] {1, 1600});
        plot2.setYLim(yscale);
        println("runnum "+numrun);
        if(numrun == 0){
          plot2.setPoints(data);
        }
        else{
          plot2.addLayer("layer_"+str(numrun),data);
          plot2.getLayer("layer_"+str(numrun)).setPointColors(new int[]{color(random(255),random(255),random(255))});
        }
        dataraw = newdataraw; 
       // println(data);
   }
} // end graph data