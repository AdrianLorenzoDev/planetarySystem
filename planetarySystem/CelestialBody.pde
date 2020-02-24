public class CelestialBody implements Drawable, Rotatable {
  private Vector position;
  private float radius;
  private Vector rotation;
  private Vector rotationDelta;
  private color bodyColor;
 
  public CelestialBody(float radius, Vector position, Vector rotationDelta, color bodyColor) {
    this.radius = radius; 
    this.position = position;
    this.rotation = new Vector();
    this.rotationDelta = rotationDelta;
    this.bodyColor = bodyColor;
  }
  
  public void rotate() {
    rotation = rotation.add(rotationDelta);
  }
  
  public void setPosition(Vector position) {
     this.position = position;
  }
  
  public Vector getPosition() {
    return this.position;
  }
  
  public float getRadius() {
    return this.radius;
  }

  public void setNewPosition(Vector position) {
    this.position = position;
  }

  public void draw() {
    pushMatrix();
    translate(position.getX(), position.getY(), position.getZ());
    rotateY(rotation.getY());
    rotateX(rotation.getX());
    noStroke();
    fill(bodyColor);
    sphere(radius);
    popMatrix();
  }
}
