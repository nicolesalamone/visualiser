
// Custom Cube Class

class CubeKick {
  // Position, velocity vectors
  PVector position;
  PVector velocity;
  // Also using PVector to hold rotation values for 3 axes
  PVector rotation;

  // Vertices of the cube
  PVector[] vertices = new PVector[24];
  // width, height, depth
  float w, h, d;

  // colors for faces of cube
  color[] quadBG = new color[6];

  CubeKick(float w, float h, float d) {
    this.w = w;
    this.h = h;
    this.d = d;
    
    // Colors are hardcoded
    quadBG[0] = color(0,0,0,50);
    quadBG[1] = color(51);
    quadBG[2] = color(204);
    quadBG[3] = color(153);
    quadBG[4] = color(360, 0, 100);
    quadBG[5] = color(360,0,100, 50);
   
    // Start in center
    position = new PVector();
    // Random velocity vector
    velocity = PVector.random3D();
    // Random rotation
    rotation = new PVector(random(80, 500), random(80, 500), random(80, 500));

    // cube composed of 6 quads
    //front
    vertices[0] = new PVector(-w/2, -h/2, d/2);
    vertices[1] = new PVector(w/2, -h/2, d/2);
    vertices[2] = new PVector(w/2, h/2, d/2);
    vertices[3] = new PVector(-w/2, h/2, d/2);
    //left
    vertices[4] = new PVector(-w/2, -h/2, d/2);
    vertices[5] = new PVector(-w/2, -h/2, -d/2);
    vertices[6] = new PVector(-w/2, h/2, -d/2);
    vertices[7] = new PVector(-w/2, h/2, d/2);
    //right
    vertices[8] = new PVector(w/2, -h/2, d/2);
    vertices[9] = new PVector(w/2, -h/2, -d/2);
    vertices[10] = new PVector(w/2, h/2, -d/2);
    vertices[11] = new PVector(w/2, h/2, d/2);
    //back
    vertices[12] = new PVector(-w/2, -h/2, -d/2); 
    vertices[13] = new PVector(w/2, -h/2, -d/2);
    vertices[14] = new PVector(w/2, h/2, -d/2);
    vertices[15] = new PVector(-w/2, h/2, -d/2);
    //top
    vertices[16] = new PVector(-w/2, -h/2, d/2);
    vertices[17] = new PVector(-w/2, -h/2, -d/2);
    vertices[18] = new PVector(w/2, -h/2, -d/2);
    vertices[19] = new PVector(w/2, -h/2, d/2);
    //bottom
    vertices[20] = new PVector(-w/2, h/2, d/2);
    vertices[21] = new PVector(-w/2, h/2, -d/2);
    vertices[22] = new PVector(w/2, h/2, -d/2);
    vertices[23] = new PVector(w/2, h/2, d/2);
  } 

  // Cube shape itself
  void drawCube() {
    // Draw cube
    for (int i=0; i<6; i++) {
      fill(quadBG[i]);
      beginShape(QUADS);
      for (int j=0; j<4; j++) {
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
  
  // Update location
  void update() {
    position.add(velocity);

    // Check wall collisions
    if (position.x > bounds/2 || position.x < -bounds/2) {
      velocity.x*=-1;
    }
    if (position.y > bounds/2 || position.y < -bounds/2) {
      velocity.y*=-1;
    }
    if (position.z > bounds/2 || position.z < -bounds/2) {
      velocity.z*=-1;
    }
  }

  
  // Display method
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(kickSize/-2*PI/rotation.x);
    rotateY(kickSize/-2*PI/rotation.y);
    rotateZ(kickSize/-2*PI/rotation.z);
    noStroke();
    drawCube(); // Farm out shape to another method
    popMatrix();
  }
}

