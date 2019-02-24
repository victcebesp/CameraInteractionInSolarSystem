class CelestialBody {
  
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  ArrayList<CelestialBody> celestialBodies;
  PVector vector;
  PShape globe;
  String name;
  
  CelestialBody(float radius, float distance, float orbitSpeed, PImage texture, String name) {
    this.vector = PVector.random3D();
    this.radius = radius;
    this.angle = random(TWO_PI);
    this.distance = distance;
    this.name = name;
    this.celestialBodies = new ArrayList();
    vector.mult(distance);
    this.orbitSpeed = orbitSpeed;
    noStroke();
    this.globe = createShape(SPHERE, radius);
    globe.setTexture(texture);
  }
  
  void spawnMoons() {
      
      CelestialBody earth = new CelestialBody(20, 130, 0.01, textures[0], "Earth");
      earth.spawnMoon();
      celestialBodies.add(earth);
      celestialBodies.add(new CelestialBody(25, 100, 0.03, textures[1], "Venus"));
      celestialBodies.add(new CelestialBody(18, 200, -0.02, textures[2], "Mars"));
      celestialBodies.add(new CelestialBody(20, 130, 0.03, textures[3], "Jupiter"));
      celestialBodies.add(new CelestialBody(30, 180, -0.02, textures[4], "Uranus"));
  }
  
  void orbit() {
    angle += orbitSpeed;
    for(CelestialBody celestialBody : celestialBodies) celestialBody.orbit();
  }
  
  void show() {
    pushMatrix();
    
    PVector perpendicular = vector.cross(new PVector(1, 0, 1));
    rotate(angle, perpendicular.x, perpendicular.y, perpendicular.z);
    translate(vector.x, vector.y, vector.z);
    shape(globe);
    translate(-this.radius / 2, -(this.radius + 10), 0);
    text(this.name, 0, 0, 0);
    fill(255);
    for(CelestialBody celestialBody : celestialBodies) celestialBody.show();
    
    popMatrix();
  }
  
  void spawnMoon() {
    celestialBodies.add(new CelestialBody(10, 50, 0.04, textures[5], "Moon"));
  }
  
}
