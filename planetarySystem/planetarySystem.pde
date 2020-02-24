String title = "Planetary system";
PImage background;
PlanetarySystemController controller;

public void settings(){
  size(1000, 1000, P3D);
  controller = new PlanetarySystemController();
}

public void setup() {
  surface.setTitle(title);
  background = loadImage("stars.jpg");
}

public void draw() {
  background(background);
  controller.run();
}

public float getRelativeToCanvasWidth(float rel) {
    return width * rel; 
}

public float getRelativeToCanvasHeight(float rel) {
    return height * rel; 
}
