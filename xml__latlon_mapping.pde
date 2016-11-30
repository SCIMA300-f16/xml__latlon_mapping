XML xml;
XML[] rows;
//setting variables for max and min
//longitudes
float minlat;
float maxlat;
float minlon;
float maxlon;

void setup() {
  size(600,600);  
  
  //load xml
  xml = loadXML("bikes.xml");
  rows = xml.getChildren("row");
  
  //setting minlon to equal MAX_FLOAT and vice versa, etc.
  minlon = MAX_FLOAT;
  maxlon = MIN_FLOAT;
  
  minlat = MAX_FLOAT;
  maxlat = MIN_FLOAT;

  for(int row=0; row<rows.length; row++) {
    
    //get the geom tag
    XML geo = rows[row].getChild("geom");
    
    //get the lat and longitude attributes
    float lat = geo.getFloat("latitude");
    float lon = geo.getFloat("longitude");
    
    //if longitude is bigger than maxlon (which it is) set maxlon
    //value to equal it
    if(lon>maxlon){
     maxlon = lon; 
    }
    if(lon<minlon){
      minlon = lon;
    }
    if(lat>maxlat){
     maxlat = lat; 
    }
    if(lat<minlat){
      minlat = lat;
    }
  }
  for(int row=0; row<rows.length; row++) {
    XML geo = rows[row].getChild("geom");
    
    // get lat and longitude attributes again 
    float lat = geo.getFloat("latitude");
    float lon = geo.getFloat("longitude");
    
    //remap the range between the minimum and the 
    //maximum latitude and longitude values to be within 
    //the range of the width and height of the canvas
    float latx = map(lat, minlat, maxlat, 0, width);
    float lony = map(lon, minlon, maxlon, 0, height);
    ellipse(latx, lony, 10, 10);
  }
  println(minlon);
  println(maxlon);
  
}