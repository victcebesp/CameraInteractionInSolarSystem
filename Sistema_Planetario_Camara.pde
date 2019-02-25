import peasy.*;

CelestialBody sun;
PImage sunTexture;
PShape destructor;
PImage[] textures;
float xDestructorCoordinate;
float yDestructorCoordinate;
float yAngle;
Boolean generalViewMode;
float cameraUpX;

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
  cameraUpX = 0;
}

void draw() {
  background(0);
  //translate(width / 2, height / 2, 0);
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
    } else if (!generalViewMode && keyCode == RIGHT) {
      cameraUpX -= 0.1;
    } else if (!generalViewMode && keyCode == LEFT) {
      cameraUpX += 0.1;
    }
  }
}

void showInstructions() {
  
  text("To move the spaceship forward/backward press w/s", -100, 100, 0);
  text("To move the spaceship up/down press SPACE/x", -100, 120, 0);
  text("To move the spaceship right/left press d/a", -100, 140, 0);
  text("To change the spaceship camera press c", -100, 160, 0);
  text("You can move the spaceship camera target with the mouse pointer", -100, 180, 0);
  text("To roll the spaceship camera right/left press right-arrow/left-arrow", -100, 200, 0);
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
    camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0), mouseX - width/2, mouseY - height/2, 0, 0, 1, 0);
  } else {
    float x = cos(yAngle) * (xDestructorCoordinate*0.17);
    float y = -yDestructorCoordinate*0.17;
    float z = sin(yAngle) * (xDestructorCoordinate*0.17);
    if(sin(yAngle) > 0) {
      camera(x, y, z, mouseX - width/2, mouseY - height/2, 0, cameraUpX, 1, 0);
    } else {
      camera(x, y, z, -(mouseX - width/2), mouseY - height/2, 0, -cameraUpX, 1, 0);
    }
    println(cameraUpX);
  }
}
