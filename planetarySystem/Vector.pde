public class Vector {
  private float x;
  private float y;
  private float z;
  
  public Vector() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }
  
  public Vector(float x) {
    this.x = x;
    this.y = 0;
    this.z = 0;
  }
  
  public Vector(float x, float y) {
    this.x = x;
    this.y = y;
    this.z = 0;
  }
  
  public Vector(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public float getX(){
    return x;
  }

  public float getY() {
    return y;
  }
  
  public float getZ() {
    return z;
  }

  public void setX(float x){
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }
  
  public void setZ(float z) {
    this.z = z;
  }

  public Vector add(Vector other){
    return new Vector(getX() + other.getX(), getY() + other.getY(), getZ() + other.getZ());
  }
  
  public Vector substract(Vector other){
    return new Vector(getX() - other.getX(), getY() - other.getY(), getZ() - other.getZ());
  }
}
