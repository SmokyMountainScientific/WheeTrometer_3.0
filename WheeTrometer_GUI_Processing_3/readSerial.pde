void  read_serial() {

  if (serial.available () <= 0) {  //changed from while 
    } 
    if (serial.available() > 0 && bool == true) { 
      sData = serial.readStringUntil(LINE_FEED);
        if (sData != null) {
          float fData = float(sData);
          if(fData <= 0){ fData = 0;}
          logData(dataPath(file1), trim(sData)+",", true); //logData(file1,getDateTime() + sData,true);logData(file1,sData,true);
          if (i==0 && fData >= 0) { 
              dataraw[i] = fData;
            }
            if (i>0 && fData >=0) { //
              dataraw = append(dataraw, fData);
            }
            i +=1;// ++i;
          
          String[] endsig = match(sData,"@");  
          if (endsig!=null){ //if (cData == '*') {*
            println("stop");
            bool = false;
            gotparams = false;
            myTextarea2.setColor(#036C09);
            myTextarea2.setText("FINISHED");
            cData = '@';
            logData(dataPath(file1),"\n",true);
          }
          
          String[] runnum = match(sData2,"r");  
          if (runnum!=null){ //if (cData == '*') {*
            println("run-"+(numrun+1));
            myTextarea2.setText("run-"+(numrun+1));
            runnum = null;
            //numrun+=1;
          }
       }   
    }      
  
} // end read_serial   