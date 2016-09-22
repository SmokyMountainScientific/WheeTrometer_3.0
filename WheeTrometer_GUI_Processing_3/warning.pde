

//class WarningSketch extends EmbeddedSketch{
 private class ThirdApplet extends PApplet{ 
  
  void setup()
  {
    size(250,250);
    PFont font = createFont("SansSerif",16);
    textFont(font, 12);
    smooth();
    textAlign(CENTER,CENTER);
    fill(20,120,20);
   // warning.setResizable(true);
    
  cp5c = new ControlP5(this);  
   cp5c.addBang("OK")
    .setColorBackground(#FFFEFC)//#FFFEFC 
        .setColorCaptionLabel(#030302) //#030302
          .setColorForeground(#AA8A16)
            .setColorActive(#06CB49)            
              .setSize(66, 30)
                .setTriggerEvent(Bang.RELEASE)
                  .setLabel("OK") //
                    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)  //.setLabel("Start_Run")
                      ;
                      
    warningtxt = cp5c.addTextarea("warning txt")
        .setFont(font)
          .setLineHeight(20)
            .setColor(#030302)
              .setColorBackground(#CEC6C6)
                .setColorForeground(#AA8A16)//#CEC6C6
                    ;
                    
  }
  
  void draw(){
    
    //super.draw();   // Should be the first line of draw().
    try{
    background(#ACB7B5);//(200,255,200);
    if(width >=200 && height >=100){ 
    warningtxt.setSize(width-40, height-60);
    warningtxt.setPosition(20,20);//(width/2-100, height/2);
 //   cp5c.controller("OK").setPosition(width/2-33, height-35);
    }
    }
    catch(Exception e){
    println("warning wndow");
  }
  }
  
  
  void OK(){
//    warning.hide();
  }
  
} 