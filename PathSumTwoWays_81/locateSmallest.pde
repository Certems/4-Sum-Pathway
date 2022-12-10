int smTile;

int locateSmallest(){
  smTile = int(pow(size,2))-1; //<-----TEMP
  for (int x=0 ; x<pow(size,2) ; x++){
    if (tiles.get(x).sumDist <= tiles.get(smTile).sumDist && tiles.get(x).checked == false){
      smTile = x;
    }
  }
  return smTile;
}
