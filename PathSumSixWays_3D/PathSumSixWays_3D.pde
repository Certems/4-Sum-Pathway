BufferedReader reader;

String lines;
String name;

int size;
int colLength;
int rowLength;
int latestTile;
int shortestRoute;
ArrayList<ArrayList<ArrayList<Integer>>> numbers;
ArrayList<tile> tiles;

void setup(){
  //frameRate(10);
  numbers = new ArrayList<ArrayList<ArrayList<Integer>>>();
  tiles = new ArrayList<tile>();
  reader = createReader("3Dmatrix.txt");
  size = matrixSize();
  
  colLength = 100;
  rowLength = 100;
  //colLength = floor(width/size);
  //rowLength = floor(height/size);
  
  size(800,800,P3D);
  //
  textAlign(CENTER,CENTER);
  textSize(colLength/3);
  for (int z=0 ; z<size ; z++){
    for (int x=0 ; x<size ; x++){
      for (int y=0 ; y<size; y++){
        tile piece = new tile(numbers.get(z).get(y).get(x),new PVector(x*colLength,y*rowLength,z*colLength));
        tiles.add(piece);
      }
    }
  }

  tiles.get(0).sumDist = tiles.get(0).value;
  camera(500,-300,1000,tiles.get(62).pos.x,tiles.get(62).pos.y,tiles.get(62).pos.z,0,1,0);
  
  //background(200,200,255);
  frameRate(10);
}

void draw(){
  clear(); background(200,200,255);
  for (tile c_tile : tiles){
    c_tile.update();
  }
  //rotateY((float)frameCount/120);
  search();
}
