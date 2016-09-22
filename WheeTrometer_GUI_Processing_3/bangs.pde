public void Connect() {             // conect to com port bang
   if(Comselected==false){
 try{
  serial = new Serial(this, comList[Ss], 19200);
  println("connected to"+comList[Ss]);
  myTextarea2.setText("CONNECTED");
  Comselected = true;
 }
 catch (Exception e){
 //  warning.show();
   warningtxt.setText("Some type of com port error");
   println("Some type of com port error. Restart program");
   myTextarea2.setText("COM ERROR");
 }
   }
   else{
   println("already connected");
   }
}


public void Save_run() {             // set path bang   
  selectOutput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    file2 = selection.getAbsolutePath();
    println("User selected " + file2);
   // myTextarea.setText(file2);
      ///////////////////////////////////////
  //  String file2 = "C:/Users/Ben/Documents/Voltammetry Stuff/log/data.txt";
  try{
  //saveStream(file2,file1);
  //String[] file1str = loadStrings(file1);
  println(dataPath(file1));
  Table table = loadTable(dataPath(file1));
  //for(int k = 0; k < table.getColumnCount(); k++){
    //println(table.getString(0,k));
  //}
    println("table col: "+table.getColumnCount()+" table row: "+table.getRowCount());
    println("balnk: "+blank.length);
  //String[] blankstr = loadStrings(blankfile);
   
    int tablerows = table.getRowCount()-1;
    logData(file2, "wavelength (nm)"+","+"blank (au)"+","+"intensity (au)"+"\n", true);
    for(int k = 0; k < wavelength.length; k++){
    logData(file2, wavelength[k]+","+blank[k]+","+table.getString(tablerows,k)+"\n", true);
    }
    
      }
      catch(Exception e){
        println("did not save right "+e);
      }
/////////////////////////////////////////
  }
} 



public void Start_Run() {  // start run bang
  if(blank.length >750){
  bool = true;
  myTextarea2.setColor(#D8070E);
  myTextarea2.setText("RUNNING SCAN");
  }
  else{
  myTextarea2.setColor(#D8070E);
  myTextarea2.setText("RUN BLANK");
  }
}

public void Integrate_Data() {  // intergrate data bang
//win.show();
winshow = true;
}    //integrate bag for popup window is in intergrat_window tab//

public void Blank() {  // intergrate data bang
  bool = true;
  runblank = true;
  myTextarea2.setColor(#D8070E);
  myTextarea2.setText("RUNNING BLANK");
  blank = newblank;
} 