
/* base on Daniel Shiffman 's code
   2017.05.15 
   
*/

Vehicle v ;

void setup() {
  size(640 , 360);
  v = new Vehicle( width/2 , height/2 ) ;
}

void draw() {
  background(200);
  
  PVector mouseLoc = new PVector( mouseX , mouseY ) ;
  
  fill(200);
  stroke(0);
  strokeWeight(2);
  
  ellipse( mouseLoc.x , mouseLoc.y , 48 , 48 );
  
  v.seek(mouseLoc);
  v.update();
  v.display();
}


