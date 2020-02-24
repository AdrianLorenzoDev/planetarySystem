public class Satellite extends CelestialBody implements Translatable {
  private float translationDelta;

  public Satellite(float radius, Vector position, color bodyColor, Vector rotationDelta, float translationDelta) {
    super(radius, position, rotationDelta, bodyColor);
    this.translationDelta = translationDelta;
  }
  
  public void translate(Vector origin) {
    translate(origin, this.translationDelta);
  }
  
  public void translate(Vector origin, float translationDelta) {
    Vector pos = super.position.substract(origin);
    
    pos = new Vector( 
      pos.getX() * cos(translationDelta) - pos.getZ() * sin(translationDelta), 
      pos.getY(), 
      pos.getX() * sin(translationDelta) + pos.getZ() * cos(translationDelta)
    );
    
    super.position = pos.add(origin);
  }
  
  public void draw() {
    super.draw();
  }
}
