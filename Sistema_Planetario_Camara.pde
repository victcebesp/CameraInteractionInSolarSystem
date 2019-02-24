import peasy.*;

CelestialBody sun;
PImage sunTexture;
PShape destructor;
PImage[] textures;
float xDestructorCoordinate;
float yDestructorCoordinate;
float yAngle;
Boolean generalViewMode;
float lastCameraX;
float lastCameraY;
float lastCameraZ;

void setup() {
  size(600, 600, P3D);
  sunTexture = loadImage("data/sun.jpg");
  destructor = loadShape("data/star_destroyer.obj");
  textures = new PImage[7];
  textures[0] = loadImage("data/earth.jpg");
  textures[1] = loadImage("data/venus.jpg");
  textures[2] = loadImage("data/mars.jpg");
  textures[3] = loadImage("data/jupiter.jpg");
  textures[4] = loadImage("data/uranus.jpg");
  textures[5] = loadImage("data/moon.jpg");
  sun = new CelestialBody(50, 0, 0, sunTexture, "Sun");
  sun.spawnMoons();
  xDestructorCoordinate = 1000;
  yDestructorCoordinate = 0;
  yAngle = 0;
  generalViewMode = true;
}

void draw() {
  background(0);
  translate(width / 2, height / 2, 0);
  lights();
  sun.show();
  sun.orbit();
  showDestructor();
  showInstructions();
  showCamera();
}

void showDestructor() {
  pushMatrix();
  scale(0.17);
  rotateX(PI);
  updateDestructorCoordinates();
  rotateY(yAngle);
  translate(xDestructorCoordinate, yDestructorCoordinate, 0);
  rotateY(PI);
  shape(destructor);
  popMatrix();
}

void updateDestructorCoordinates() {
  if (keyPressed) {
    if (key == 'w') {
      xDestructorCoordinate -= 10;
    } else if (key == 's') {
      xDestructorCoordinate += 10;
    } else if (key == 'd') {
      yAngle -= 0.05;
    } else if (key == 'a') {
      yAngle += 0.05;
    } else if (key == ' ') {
      yDestructorCoordinate += 10;
    } else if (key == 'x') {
      yDestructorCoordinate -= 10;
    }
  }
}

void showInstructions() {
  text("You can move the camera with the mouse (click and drag)", -100, 100, 0);
  text("You can zoom in/out with the mouse wheel", -100, 120, 0);
  text("To move forward/backward press w/s", -100, 140, 0);
  text("To move up/down press SPACE/x", -100, 160, 0);
  text("To move right/left press d/a", -100, 180, 0);
}

void keyPressed() {
  if(key == 'c') {
    if(generalViewMode) {
      generalViewMode = false;
    } else {
      generalViewMode = true;
    }
  }
}

void showCamera() {
  if(generalViewMode) {
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), mouseX, mouseY, 0, 0, 1, 0);
  } else {
    float x = cos(yAngle) * (xDestructorCoordinate*0.17 + width/2.0);
    float y = -yDestructorCoordinate*0.17 + height/2.0;
    float z = sin(yAngle) * (xDestructorCoordinate*0.17 + width/2.0);
    println("x: " + x + "y: " + y + "z: " + z);
    println("yAngle: " + yAngle);
    pushMatrix();
    translate(-width, 0, 0);
    sphere(10);
    popMatrix();
    camera(x, y, z, -width, height/2.0, 0, 0, 1, 0);
  }
}
