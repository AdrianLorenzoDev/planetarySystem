public class Planet extends CelestialBody implements Translatable {
  private float translationDelta;
  private Satellite[] satellites;
  
  public Planet(float radius, Vector position, color bodyColor, Vector rotationDelta, float translationDelta, Satellite[] satellites) {
    super(radius, position, rotationDelta, bodyColor);
    this.translationDelta = translationDelta;
    this.satellites = satellites;
  }
  
  public void translate(Vector origin) {
    Vector pos = super.position.substract(origin);
    
    pos = new Vector( 
      pos.getX() * cos(translationDelta) - pos.getZ() * sin(translationDelta), 
      pos.getY(), 
      pos.getX() * sin(translationDelta) + pos.getZ() * cos(translationDelta)
    );
    
    super.position = pos.add(origin);
    
    for (Satellite satellite : satellites) {
      satellite.translate(origin, this.translationDelta);
    }
  }
  
  public void draw() {
    super.draw();
    for (Satellite satellite : satellites) {
      satellite.translate(super.position);
      satellite.rotate();
      satellite.draw();
    }
  }
}
