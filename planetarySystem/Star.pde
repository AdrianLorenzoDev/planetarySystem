public class Star extends CelestialBody {
  private Planet[] planets;
  
  public Star(float radius, Vector position, color bodyColor, Vector rotationDelta, Planet[] planets) {
    super(radius, position, rotationDelta, bodyColor);
    this.planets = planets;
  }

  public void draw() {
    pointLight(255, 255, 255, super.position.getX(), super.position.getY(), super.position.getZ());
    ambientLight(255, 255, 255, super.position.getX(), super.position.getY(), super.position.getZ());
    super.draw();
    
    for (Planet planet : planets) {
      planet.translate(super.position);
      planet.rotate();
      planet.draw();
    }
  }
}
