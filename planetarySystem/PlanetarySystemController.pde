public class PlanetarySystemController {
   private Star star;
   
   private final float rotationDelta = PI / 128;
   private final float translationDelta = PI / 128;
   private final Vector starPosition = new Vector(getRelativeToCanvasWidth(0.5), getRelativeToCanvasHeight(0.5), 0);
   
   public PlanetarySystemController() {
     float starRadius = getRelativeToCanvasWidth(0.1);
     star = new Star(
       starRadius,
       starPosition,
       Colors.starColors[int(random(0, Colors.starColors.length))],
       new Vector(0, rotationDelta / 2),
       getRandomPlanets(starRadius, starPosition)
     );
   }
   
   public Planet[] getRandomPlanets(float starRadius, Vector starPosition) {
     Planet[] planets = new Planet[int(random(5, 9))];
     float distance = starPosition.getX() - starRadius - starRadius*4.5;
     
     for (int i = 0; i < planets.length; i++) {
       float planetRadius = random(starRadius*0.35, starRadius*0.55);
       Vector planetPosition = new Vector(distance, starPosition.getY(), starPosition.getZ());
       Satellite[] satellites = getRandomSatellites(planetRadius, planetPosition);

       planets[i] = new Planet(
         planetRadius,
         planetPosition,
         Colors.planetColors[int(random(0, Colors.planetColors.length))],
         new Vector(0, random(-rotationDelta, rotationDelta)),
         random(-translationDelta/3, translationDelta/3),
         satellites
       );
       
       int lastIndex = satellites.length-1; 
       if (lastIndex >= 0) {
        distance = satellites[lastIndex].getPosition().getX() - satellites[lastIndex].getRadius() - starRadius*3.5;
       } else {
        distance -= planetRadius + starRadius*3.5;
       }
     }
     
     return planets;
   }
   
   public Satellite[] getRandomSatellites(float planetRadius, Vector planetPosition) {
     Satellite[] satellites = new Satellite[int(random(0, 3))];
     float distance = planetPosition.getX() - planetRadius - planetRadius*2;
     
     for (int i = 0; i < satellites.length; i++) {
       float satelliteRadius = random(planetRadius*0.2, planetRadius*0.4);
       satellites[i] = new Satellite(
         satelliteRadius,
         new Vector(distance, starPosition.getY(), starPosition.getZ()),
         Colors.satelliteColors[int(random(0, Colors.satelliteColors.length))],
         new Vector(0, random(-rotationDelta, rotationDelta)),
         random(-translationDelta*2, translationDelta*2)
       );
       
       distance -= satelliteRadius + planetRadius*2;
     }
       
    return satellites;
   }
   
   
  
   public void run() {
     camera(
       getRelativeToCanvasWidth(0), 
       getRelativeToCanvasWidth(-0.3), 
       getRelativeToCanvasWidth(5), 
       starPosition.getX(), starPosition.getY(), 
       starPosition.getZ(), 0, 1, 0);
     star.rotate();
     star.draw();
   }
}
