BufferedReader reader;

String lines;
String name;

int size;
int colLength;
int rowLength;
int latestTile;
int shortestRoute;

ArrayList<ArrayList<Integer>> numbers;
ArrayList<tile> tiles;

void setup(){
  //frameRate(10);
  numbers = new ArrayList<ArrayList<Integer>>();
  reader = createReader("matrix.txt");
  size = matrixSize();
  colLength = floor(width/size);
  rowLength = floor(height/size);
  size(800,800);
  textAlign(CENTER,CENTER);
  textSize(colLength/3);
  tiles = new ArrayList<tile>();
  for (int x=0 ; x<size ; x++){
    for (int y=0 ; y<size; y++){
      tile piece = new tile(numbers.get(y).get(x),new PVector(x*colLength,y*rowLength));
      tiles.add(piece);
    }
  }

  tiles.get(0).sumDist = tiles.get(0).value;
  
  background(200,200,255);
  //search();
  frameRate(60);
}

void draw(){
  //background(200,200,255);
  for (tile c_tile : tiles){
    c_tile.update();
  }
   
  search();
    
}
