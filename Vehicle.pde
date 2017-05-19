
/* 2017.05.15 */

class Vehicle {
 
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  
  float r ;
  float maxForce ;
  float maxSpeed ;
  
  Vehicle( float locX , float locY ) {
    
    acceleration = new PVector(0,0) ;
    velocity     = new PVector(0 , -2) ;
    location     = new PVector( locX , locY ) ;
    
    r = 6.0 ;
    maxSpeed = 4.0 ;
    maxForce = 0.1 ;
    
  }
  
  void update() {
    
    velocity.add( acceleration );
    velocity.limit( maxSpeed ) ;
    location.add( velocity ) ;
    acceleration.mult(0) ;
  }
  
  void applyForce( PVector force ) {
    acceleration.add( force ) ;
  }
  
  void seek( PVector target ) {
    PVector desired = PVector.sub( target , location ) ;
    desired.setMag( maxSpeed ) ;
    
    PVector steer = PVector.sub( desired , velocity ) ;
    steer.limit( maxForce ) ;
    
    applyForce( steer ) ;
  }
  
  void display() {
    float theta = velocity.heading2D() + PI/2 ;
    
    fill(127);
    stroke(0);
    strokeWeight(1);
    
    pushMatrix();
    
    translate( location.x , location.y );
    rotate(theta);
    
    beginShape();
    vertex(0 , -r*2);
    vertex(-r , r*2);
    vertex(r , r*2);
    endShape(CLOSE);
    
    popMatrix();
  }
  
  
}
