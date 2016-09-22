
  // Energia help and download (http://energia.nu/)

long place[6]={100000,10000,1000,100,10,1};           /* {serial read conversions. each incoming byte in multiplied 
                            by the corrosponding place value then summed to get the
                            original vlaue} */
long incomingByte[6] = {0,0,0,0,0,0};                 // serial read variable. each incoming byte (multiplied by the place)
                                                      // is stored here. later the get summed to obtain the correct number      
int pgm;                                              // 0: absorbance, 1: transmitance, 2: series
int ard;
int aread[4][768];                                    // used for 4 run average
int itteration = 0;                                   //
int inttime = 0;                                      //0-500
int runinterval;
int numruns;

#define  CLK  PD_0//PF_2//PD_0                        
#define  SI  PD_1//PF_3//PD_1                         
#define  ARD  A5


/**********************************************/
void setup() {

  pinMode (CLK,OUTPUT);      //   
  pinMode (SI,OUTPUT);      // 
  pinMode (ARD,INPUT);

}


void loop() {
    Serial.begin(19200);
    delay(100);    
  
  Serial.flush();
  setup_run();
  conversions ();
  while (Serial.available()<= 0) {       // do nothing if no GO signal
  }
  if (Serial.read() == '*'){           // start if recieved GO signal from GUI
   
     for(itteration = 0; itteration < 4; itteration++){
       D_array();
     }
   for(int i = 0;i< 768;i++){
          ard = 0;
     for(int j =0;j<4;j++){
       ard += aread[j][i];
     }
     ard = ard/4;
     Serial.println(ard);
     
     delay(1);
   }  
  }
  
  delay(10);
  Serial.println("@");                     // signal GUI to end run
  delay(10);
  Serial.flush();
  delay(10);
  Serial.end();

}  // end loop

