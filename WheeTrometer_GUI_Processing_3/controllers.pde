void cp5_controllers_setup(){
 ////////////////////////////////////////////////Text Fields//////////////////////////////
  cp5 = new ControlP5(this);  //cp5 = new ControlP5(this);
  PFont font = createFont("arial", 14);
  PFont font2 = createFont("arial", 16);
  PFont font3 = createFont("arial",12); 
  int lowY = height -80;
  int buttonC = #E3CA85;
  int runC = #C64F2E;
  
  integration_Time = cp5.addTextfield("Integration_Time")
    .setColor(#030302) 
      //.setColorActive(#AA8A16)
      .setColorBackground(#CEC6C6)//(#FFFEFC) 
        //.setColorCaptionLabel(#F01B1B) 
        .setColorForeground(#AA8A16) 
          //.setColorValueLabel(#F01B1B)
          .setPosition(20, lowY)               // new
            .setSize(60, 25)
              .setFont(font)
                .setFocus(false)
                  //.setLabel("initial voltage (mV)")                
                    .setText("100");
   /*                   controlP5.Label svl = integration_Time.captionLabel(); 
                        svl.setFont(font);
                          svl.toUpperCase(false);
                            svl.setText("integration(msec)") */
                            ;
  ;

  
    Number_of_Runs = cp5.addTextfield("Number_of_Runs")  // time based txt field
    .setColor(#030302) 
      //.setColorActive(#AA8A16)
      .setColorBackground(#CEC6C6) 
        //.setColorCaptionLabel(int) 
        .setColorForeground(#AA8A16) 
          //.setColorValueLabel(int)  
          .setPosition(250, lowY)
            .setSize(60, 25)
              .setFont(font)
                .setFocus(false)
                  //.setLabel("concentration time (sec)")
                    .setText("60");
     /*                 controlP5.Label norl = Number_of_Runs.captionLabel(); 
                        norl.setFont(font);
                          norl.toUpperCase(false);
                            norl.setText("#Runs");  */                  
  ;
  
    Run_Interval = cp5.addTextfield("Run_Interval")  // time based txt field
    .setColor(#030302) 
      //.setColorActive(#AA8A16)
      .setColorBackground(#CEC6C6) 
        //.setColorCaptionLabel(int) 
        .setColorForeground(#AA8A16) 
          //.setColorValueLabel(int)  
          .setPosition(330, lowY)
            .setSize(60, 25)
              .setFont(font)
                .setFocus(false)
                  //.setLabel("concentration time (sec)")
                    .setText("60");
          /*            controlP5.Label ril = Run_Interval.captionLabel(); 
                        ril.setFont(font);
                          ril.toUpperCase(false);
                            ril.setText("Interval(sec)");  */                  
  ;

  ///////////////////////////////////////text area//////////////////////////

  myTextarea2 = cp5.addTextarea("txt2")  // status and com port text area
    .setPosition(300, 10)
      .setSize(100, 30)
        .setFont(createFont("arial", 12)) //(font)
          .setLineHeight(10)
            .setColor(#030302)
              .setColorBackground(#CEC6C6)
                .setColorForeground(#AA8A16)//#CEC6C6                 
                    ;


  /////////////////////////////Bang's///////////////////////////////////////////////////////////
  cp5.addBang("Start_Run")
    .setColorBackground(255)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(runC)
          .setColorActive(#06CB49)
            .setPosition(400, height-80)
              .setSize(80, 25)
                .setTriggerEvent(Bang.RELEASE)
                  .setLabel("Start Run") //
                    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                      ;

 cp5.addBang("Connect")
    .setColorBackground(#FFFEFC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(buttonC)  
          .setPosition(240, 10)
            .setSize(40, 20)
              .setTriggerEvent(Bang.RELEASE)
                .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                  ;

  cp5.addBang("Save_run")
    .setColorBackground(buttonC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(buttonC)  
          .setPosition(420, 10)
            .setSize(80, 25)
              .setTriggerEvent(Bang.RELEASE)
                .setLabel("Save Run")
                  .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                    ;
                    
   cp5.addBang("Integrate_Data")                 
      .setColorBackground(#FFFEFC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(buttonC)  
          .setPosition(420, 45)
            .setSize(80, 25)
              .setTriggerEvent(Bang.RELEASE)
                .setLabel("Integrate Peaks")
                  .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                    ;
                    
     cp5.addBang("Blank")                 
      .setColorBackground(#FFFEFC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(buttonC)  
          .setPosition(110, lowY)
            .setSize(60, 25)
              .setTriggerEvent(Bang.RELEASE)
                .setLabel("Blank")
                  .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                    ;               
                    

  //////////////////////////////////////////Dropdownlist////////////////////////////////////////
    cp5.addScrollableList("mode")
     .setPosition(10, 10)
     .setSize(100, 84)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(modeList);
 
  comList = serial.list(); 
  cp5.addScrollableList("ports")
     .setPosition(130, 10)
     .setSize(100, 84)
     .setBarHeight(20)
     .setItemHeight(20)
      .addItems(comList);

  ////////////////////////////////////////////////////////////check box/////////////////////////////////////////////
  checkbox = cp5.addCheckBox("checkBox")
    .setColorForeground(color(120))
      .setColorActive(#297C1D)
        .setColorLabel(color(255))  
          .setPosition(600, 10)
            .setSize(20, 20)
               .addItem("Overlay Runs?",0);
                      
}//////////////////////////////////end cp5_controllers-setup//////////