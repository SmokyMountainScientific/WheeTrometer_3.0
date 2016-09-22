
///////////////////////////////////////// Imports/////////////////////////////////
import java.awt.Toolkit;
import java.awt.GraphicsEnvironment;
import java.awt.GraphicsDevice;
import java.awt.DisplayMode;
import java.awt.*;
import java.util.*;

import grafica.*;                    // For chart classes.
import controlP5.*;                  // for buttons and txt boxes
import processing.serial.*;          // for serial
import java.io.*;                    // for file stuff
//import PFrame.*;      // for extra windows
///////////////////////////////////////////////////////////////Classes///////////////
public GPlot plot1, plot2;
GPointsArray data = new GPointsArray(768);
GPointsArray newdata = new GPointsArray(768);
GPointsArray integration_data = new GPointsArray(768);
GPointsArray Gbaseline = new GPointsArray(2);

ControlP5 cp5,cp5b,cp5c,cp5d;
Serial serial;
Textarea myTextarea;   // com port and status window
Textarea myTextarea2;   // save file path window
Textarea warningtxt;  // text for warning window
Textfield Run_Interval,Number_of_Runs, integration_Time;
//DropdownList ports, mode;              //Define the variable ports and mode as a Dropdownlist.
CheckBox checkbox;

SecondApplet secondApplet = null;
// PFrame win = null;
ThirdApplet thirdApplet = null;
// PFrame warning = null;  cut JSS 7/16
////////////// colors /////////////////
int bckgnd = #3C88A5;

//////////////////////////////////variables//////////////////////////////////////////
String[] wavedata ; //= loadStrings("wavelength_on_pda_element.csv");
float[] wavelength; //  = new float[wavedata.length-1];
////////////////////////////////////////////////////////////////////////////////////
int LINE_FEED=10; 
boolean winshow = false;
boolean overlaydata = false;
float[] yscale = new float[2];
int numrun = 0;
String sData3 ="";
char[] strtochar;
int updatechart;
boolean gotparams = false;
float wdth;
float higt;
boolean mousest = false;
boolean nxtpt = false;
int Ss;                          //The dropdown list will return a float value, which we will connvert into an int. we will use this int for that).
String[] comList ;               //A string to hold the ports in.
String[] comList2;               // string to compare comlist to and update
boolean serialSet;               //A value to test if we have setup the Serial port.
boolean Comselected = false;     //A value to test if you have chosen a port in the list.
int Modi; 
boolean Modesel = false;
String Modetorun;
int xacu;
int yacu;
float xspace;
float yspace;
ArrayList qdat;
boolean bool = false;
float p1;
float p2;
String IntTime;
int iIntTime;
String NumRuns;
int iNumRuns;
String RunInt;
int iRunInt;
int xPos = 150; 
String ComP;
int serialPortNumber;
String file1 = "logdata.csv";//"C:/Users/Ben/Documents/Voltammetry Stuff/log/data.txt";  //"C:/Users/Public/Documents/Electrochem/logfiletest/TestLog.txt"
String file2;
String blankfile = "blank.csv";
String file;
//String[] sData = new String[3];  //String sData;
String sData;
String sData2 = " ";
char cData;
int logDelay = 1000;
String Go = "*";
String Absorbancemode = "1";
String Transmitancemode = "2";
String Seriesmode = "3";
int i =0;
float [] dataraw = {0};
float [] newdataraw = {0};
float [] blank = {0};
float [] newblank = {0};
boolean runblank = false;
///integration variables///////////////////////
ArrayList pvector_dat = new ArrayList();
float bx1;
float by1;
float bbtm;
float bwdth;  //
PVector XY1;   // baseline point 1
PVector XY2;  // baseline pooint 2
float area;  // peak area
float areabase;  // baseline area (subtracted from peak area)
float peaktest;  // variable for peak height
float peakheight;  // variable for peak height
//////////////font varialbes///////////////////////////////
  PFont font;
  PFont font2;
  PFont font3;
  PFont font4;
/////************************////////
  String[] modeList = {"Absorbance","Transmittance","Series"};
  
///////////////////////////////Setup////////////////////////////////////////////////////
void setup() {
  size(800, 675); // (800, 700)
  font = createFont("ArialMT", 20);
    font2 = createFont("ArialMT", 20);
      font3 = createFont("ArialMT", 20);
        font4 = createFont("Andalus", 16);

wavedata = loadStrings("wavelength_cal.csv");

wavelength  = new float[wavedata.length-1];

 for(int i=0; i<wavedata.length-1; i++){
    String[] tokens = wavedata[i+1].split(",");
    wavelength[i]  = Float.parseFloat(tokens[1]);   
  }
  
  logData(dataPath(file1),"",false);  // clear logfile
  logData(dataPath(blankfile),"",false);  // clear logfile

  frameRate(2000);

  textFont(font2);
  surface.setResizable(true);
  charts_grafica_setup();
  cp5_controllers_setup();

  secondApplet = new SecondApplet(); 
  thirdApplet = new ThirdApplet();
  
 
}////////////////////End Setup/////////////////////////////
/////////////////////////////////////////////////Draw//////////////////////////////////////////////    

void draw() {
  try{
    background(bckgnd); 
  
fill(255);
//rect(150, height-80,100,50);
fill(0);
   textFont(font4,18); 
   pushMatrix();
   textFont(font2,12);
   fill(#080606);
   text("Smokey Mountain Scientific",width-220,height-30);
   popMatrix(); 
   textFont(font2); 
   
     float wdth = width-140;
     float hgt = height-300;
     plot2.beginDraw();
      plot2.setPos(new float[] {20, 80});
      plot2.setDim(wdth, hgt);
      plot2.drawBackground();
      plot2.drawBox();
      plot2.drawXAxis();
      plot2.drawYAxis();
      plot2.drawTitle();
      plot2.setPointColors(new int[] {0});
      //plot2.drawGridLines(GPlot.BOTH);
      plot2.drawLines();
      plot2.drawPoints();
    plot2.endDraw(); 
 }
 catch(Exception e){
   println("main window");
 }
 
/*  comList2 = Serial.list();
  if (comList.length != comList2.length) {          //if(comList.equals(comList2)==false){ // if (comList.length != comList2.length) {
    ports.clear();
    comList = comList2;
    for (int i=0; i< comList.length; i++){
      ports.addItem(comList2[i], i);                 // add available serial ports
    }
  }
  if(comList.length == 0){
    myTextarea2.setText("NOT CONN.");
    ports.clear();                                   // clear ports dropdown list 
//    ports.captionLabel().set("Select COM port");
    try{
      serial.stop();                                   // stop the serial port so a new connection can be established
    }
    catch(Exception e){}
    Comselected = false;
  } */

  if (Modesel==false) {
    Run_Interval.hide();
    Number_of_Runs.hide();
    integration_Time.hide();
    cp5.get("Start_Run").show();
    cp5.get("Integrate_Data").hide();
    cp5.get("Blank").hide();
  }
  if (Modesel==true) {
      if (Modetorun=="Absorbance" || Modetorun=="Transmitance") {
        Run_Interval.hide();
        Number_of_Runs.hide();
        integration_Time.show();
      }
      if (Modetorun=="Series") {
        Run_Interval.show();
        Number_of_Runs.show();
        integration_Time.show();
      }
      cp5.get("Start_Run").show();
      cp5.get("Blank").show();
      cp5.get("Integrate_Data").show(); 
  } 
  
  if (bool == true && Comselected == true) {    // start run//////////////////////////  
    if (gotparams == false) {    
      data = newdata;  //float[]
      println("com "+Comselected);

    if (Modetorun.equals("Absorbance")) {
      integration_Time();
      serial.write(Absorbancemode);
      delay(100);
      serial.write(IntTime);
      delay(100);
      serial.write(Go);
      print("integration time = ");
      println(IntTime);
      println(Go);
    }
    
   if (Modetorun.equals("Transmitance")) {
      integration_Time();
      serial.write(Transmitancemode);
      delay(100);
      serial.write(IntTime);
      delay(100);
      serial.write(Go);
      println(IntTime);
      println(Go);
    }

    if (Modetorun.equals("Series")) {
      Run_Interval();
      Number_of_Runs();
      integration_Time();
      serial.write(Seriesmode);
      delay(100);
      serial.write(IntTime);
      delay(100);
      serial.write(NumRuns);
      delay(100);
      serial.write(RunInt);
      delay(100);
      serial.write(Go);
      println(IntTime);
      println(NumRuns);
      println(RunInt);
      println(Go);
    }
          
          data = new GPointsArray(768);  ///////////////////////read paramaters///////// //////////////////////////////
          i = 0;
          if (overlaydata == true || Modetorun=="Series"){ 
            if(numrun == 0){
            logData(dataPath(file1), "", false);                                            //clear data file for new data
            }
          }
          else{
            logData(dataPath(file1), "", false);                                            //clear data file for new data
          }
          while (cData!='&') {                             
            if (serial.available() > 0) { 
              cData =  serial.readChar();//cData =  serial.readChar();
              sData2 = str(cData);
              logData(dataPath(file1), sData2, true); 
              if (cData == '&') {
                logData(dataPath(file1), "\n", true); 
                if (Modetorun.equals("Absorbance")) {
                  println("paramaters recieved Absorbance");
                }
                if (Modetorun.equals("Transmitance")) {
                  println("paramaters recieved Transmitance");
                }
                if (Modetorun.equals("Series")) {
                  println("paramaters recieved Series");
                }
                }
              }
            }
          
       cData = 'a';
      }  // lvsr == false
    gotparams = true;
    ///////////////////////////////////////////////////////////////////////////read serial data //////////////////////////////////////////////////////////
    while (cData!='@') {   
      read_serial();   
     }  // end if(cData!='@')
  /////////////////////////////////////////////////////////////////////////////// graph datat//////////////////////////////////////////////////////////////  
    graph_data();
  }// end of run //////////////////////////////////////////////////******************************////////////////////////////////////  
   
    if (bool == true && comList.length==0) {
      bool = false;  
//      warning.show();
      warningtxt.setText("No COM port connection");
      println("comm not connected");
    }
}///////////////////////////End Draw////////////////////////