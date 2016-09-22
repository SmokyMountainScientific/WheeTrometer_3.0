void setup_run(){

  int n=0;
  inttime = 0;
  runinterval = 0;
  numruns = 0;
  pgm = 0;


    ////////////////mode//////////////////////////////////////  
  Serial.println("Mode (1:Absorbance, 2:Transmitance, 3:Series)");
  int mod = 0; 
 
  delayMicroseconds(300);  
   
  while (Serial.available()<= 0) {
  }
  while (Serial.available() > 0){  
    incomingByte[5] = Serial.read()-48;
  }
  pgm = incomingByte[5];
  incomingByte[5] = 0;
  Serial.println(pgm);

  //////////start voltage/////////////////////////////////
  Serial.println("Intergration Time (ms)");
  delayMicroseconds(300); 
  long It = 0;                       // local variable for temporary storage of intergration time
  n = 0;                            // loop count variable  
  while (Serial.available()<= 0) {
  }                                  //wait for incoming datat
  while (Serial.available() > 0){
    incomingByte[n] = Serial.read()-48;   // read incoming Byte and store in incomingByte array
    delay(2);
    ++n;          
  }
  for(int n=0;n<=5;++n){ //for(int n=2;n<=5;++n)    for(int n=0;n<5;n++)
    It = It + (place[n]*(incomingByte[n]));  // convert from ascii to decimal 
  }
  inttime=It;               
  Serial.println(inttime);  

  if(pgm == 3){
      
      Serial.println("Run Interval (sec)");  
      delayMicroseconds(300);   
      long Ri = 0;                                      // run interval local
      n=0;   
      //  while (Serial.read() >= 0); // clear serail available
      while (Serial.available()<= 0) {
      }
      while (Serial.available() > 0){      
        incomingByte[n] = Serial.read()-48;
        delay(2);
        ++n;
      }
      for(int n=0;n<=5;++n){
        Ri = Ri + (place[n]*(incomingByte[n])); 
      }
      runinterval = Ri;
      Serial.println(runinterval);  
      
      Serial.println("Number of Runs");  
      delayMicroseconds(300);   
      long Nr = 0;                                      // run interval local
      n=0;   
      //  while (Serial.read() >= 0); // clear serail available
      while (Serial.available()<= 0) {
      }
      while (Serial.available() > 0){      
        incomingByte[n] = Serial.read()-48;
        delay(2);
        ++n;
      }
      for(int n=0;n<=5;++n){
        Nr = Nr + (place[n]*(incomingByte[n])); 
      }
      numruns = Nr;
      Serial.println(numruns); 
  } 
        
    
  if(pgm == 1 || pgm == 3){  
    Serial.println("Absorbance"); 
  }
  if(pgm ==2){
    Serial.println("Transmitance");
  }
  Serial.print('&');
}
