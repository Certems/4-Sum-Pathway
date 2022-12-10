int currentTile = 0;
int count = 0;//<----TEMP
int solution = 0; 
void search(){
  //while (true){
    println("Search no#",count); //<----TEMP
    currentTile = locateSmallest(); //<-------- Must check around this tile
    println(currentTile);
    
    //
    pushStyle();
    fill(0,0,255);
    rect(tiles.get(currentTile).pos.x, tiles.get(currentTile).pos.y, colLength, colLength);
    popStyle();
    //
    
    if (currentTile == (pow(size,2) -1)){
      println("ROUTE FOUND");
      while (currentTile != 0){
        // IMAGING
        println(currentTile);
        pushStyle();
        fill(0,255,0);
        rect(tiles.get(currentTile).pos.x,tiles.get(currentTile).pos.y,colLength,colLength);
        popStyle();
        pushStyle();
        text(tiles.get(currentTile).value,tiles.get(currentTile).pos.x+colLength/2, tiles.get(currentTile).pos.y+rowLength/2);
        popStyle();
        // IMAGING
        solution += tiles.get(currentTile).value;
        currentTile = tiles.get(currentTile).pTile;
      }
      println("0"); // <---- Not included in while loop
      solution += tiles.get(0).value;
      println("Shortest path total: ", solution);
      // IMAGING
      pushStyle();
      fill(0,255,0);
      rect(tiles.get(0).pos.x,tiles.get(0).pos.y,colLength,colLength);
      popStyle();
      pushStyle();
      text(tiles.get(0).value,tiles.get(0).pos.x+colLength/2, tiles.get(0).pos.y+rowLength/2);
      popStyle();
      noLoop();
      // IMAGING
      //break;
    }
    // Tile to the right
    if (currentTile + size < pow(size,2) && tiles.get(currentTile).checkedFrom != currentTile +size){ //<---------------- Are you at the right edge?
      if ((tiles.get(currentTile +size).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile +size).value)){
        tiles.get(currentTile +size).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile +size).value;
        tiles.get(currentTile +size).pTile = currentTile;
        pushStyle();
        fill(255,0,0);
        rect(tiles.get(currentTile +size).pos.x, tiles.get(currentTile +size).pos.y, colLength, colLength);
        popStyle();
        tiles.get(currentTile +size).checkedFrom = currentTile;
      }
    }
    // Tile below
    if ((currentTile +1)%size != 0 && tiles.get(currentTile).checkedFrom != currentTile +1){
      if ((tiles.get(currentTile +1).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile +1).value)){
        tiles.get(currentTile +1).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile +1).value;
        tiles.get(currentTile +1).pTile = currentTile;
        pushStyle();
        fill(255,0,0);
        rect(tiles.get(currentTile +1).pos.x, tiles.get(currentTile +1).pos.y, colLength, colLength);
        popStyle();
        tiles.get(currentTile +1).checkedFrom = currentTile;
      }
    }
    // Tile above
    if (currentTile % size != 0){
    //if ((currentTile != 0 || currentTile%size != 0) && tiles.get(currentTile).checkedFrom != currentTile -1){ //<---------------- Are you at the top?
      if ((tiles.get(currentTile -1).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile -1).value)){
        tiles.get(currentTile -1).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile -1).value;
        tiles.get(currentTile -1).pTile = currentTile;
        pushStyle();
        fill(255,0,0);
        rect(tiles.get(currentTile -1).pos.x, tiles.get(currentTile -1).pos.y, colLength, colLength);
        popStyle();
        tiles.get(currentTile -1).checkedFrom = currentTile;
      }
    }
    
    
    //Tile to the left
    if (currentTile - size >= 0 && tiles.get(currentTile).checkedFrom != currentTile -size){ //<---------------- Are you at the left edge?
      if ((tiles.get(currentTile -size).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile -size).value)){
        tiles.get(currentTile -size).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile -size).value;
        tiles.get(currentTile -size).pTile = currentTile;
        pushStyle();
        fill(255,0,0);
        rect(tiles.get(currentTile -size).pos.x, tiles.get(currentTile -size).pos.y, colLength, colLength);
        popStyle();
        tiles.get(currentTile -size).checkedFrom = currentTile;
      }
    }
    
    
    tiles.get(currentTile).checked = true;
    //---------
    //break;
    count ++; //<----TEMP //<>//
    
  //}
}
