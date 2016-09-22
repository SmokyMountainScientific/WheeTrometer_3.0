// new void mode
void mode(int n){
  if(n==0){
    Modetorun = "Absorbance";
  }
  else if (n==1){
    Modetorun = "Absorbance";
  }
  else if (n==2){
  Modetorun = "Series";
}
  float sMode = cp5.get(ScrollableList.class, "mode").getValue(); //.getItem(n);
  println(n, Modetorun);  //cp5d.get(ScrollableList.class, "mode").getItem(n));
  println("mode select is true jjjj");
  Modesel = true;
}

void ports(){
  float Ssi = cp5.get(ScrollableList.class, "ports").getValue(); //.getValue(); //.getItem(n);
  Ss = int(Ssi);
  println("port is "+Ss);  //cp5d.get(ScrollableList.class, "mode").getItem(n));
  println("port select is true");
}