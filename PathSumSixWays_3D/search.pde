int currentTile = 0;
int count = 0;//<----TEMP
int solution = 0; 
void search(){
  //while (true){
    
    currentTile = locateSmallest(); //<-------- Must check around this tile
    println("CurrentTile: ",currentTile);
    
    
    pushMatrix();
    fill(0,0,255);
    translate(tiles.get(currentTile).pos.x, tiles.get(currentTile).pos.y, tiles.get(currentTile).pos.z);
    box(colLength);
    popMatrix();
    
    
    if (currentTile == (pow(size,3) -1)){
      println("ROUTE FOUND");
      while (currentTile != 0){
        pushMatrix();
        fill(0,255,0);
        translate(tiles.get(currentTile).pos.x, tiles.get(currentTile).pos.y, tiles.get(currentTile).pos.z);
        box(colLength);
        popMatrix();
        solution += tiles.get(currentTile).value;
        currentTile = tiles.get(currentTile).pTile;
      }
      println("0"); // <---- Not included in while loop
      solution += tiles.get(0).value;
      println("Shortest path total: ", solution);
      noLoop();

    }
    // Tile to the right
    if (currentTile + size < pow(size,2) && tiles.get(currentTile).checkedFrom != currentTile +size){ //<---------------- Are you at the right edge?
      if ((tiles.get(currentTile +size).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile +size).value)){
        println("1");
        tiles.get(currentTile +size).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile +size).value;
        tiles.get(currentTile +size).pTile = currentTile;
        tiles.get(currentTile +size).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(currentTile +size).pos.x, tiles.get(currentTile +size).pos.y, tiles.get(currentTile +size).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    // Tile below
    if ((currentTile +1)%size != 0 && tiles.get(currentTile).checkedFrom != currentTile +1){
      if ((tiles.get(currentTile +1).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile +1).value)){
        println("2");
        tiles.get(currentTile +1).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile +1).value;
        tiles.get(currentTile +1).pTile = currentTile;
        tiles.get(currentTile +1).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(currentTile +1).pos.x, tiles.get(currentTile +1).pos.y, tiles.get(currentTile +1).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    // Tile above
    if (currentTile % size != 0){
    //if ((currentTile != 0 || currentTile%size != 0) && tiles.get(currentTile).checkedFrom != currentTile -1){ //<---------------- Are you at the top?
      if ((tiles.get(currentTile -1).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile -1).value)){
        println("3");
        tiles.get(currentTile -1).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile -1).value;
        tiles.get(currentTile -1).pTile = currentTile;
        tiles.get(currentTile -1).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(currentTile -1).pos.x, tiles.get(currentTile -1).pos.y, tiles.get(currentTile -1).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    
    
    //Tile to the left
    if (currentTile - size >= 0 && tiles.get(currentTile).checkedFrom != currentTile -size){ //<---------------- Are you at the left edge?
      if ((tiles.get(currentTile -size).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(currentTile -size).value)){
        println("4");
        tiles.get(currentTile -size).sumDist = tiles.get(currentTile).sumDist + tiles.get(currentTile -size).value;
        tiles.get(currentTile -size).pTile = currentTile;
        tiles.get(currentTile -size).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(currentTile -size).pos.x, tiles.get(currentTile -size).pos.y, tiles.get(currentTile -size).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    
    //Tile towards
    if (currentTile -pow(size,2) >= 0 && tiles.get(currentTile).checkedFrom != currentTile -pow(size,2)){ //<---------------- Are you at the left edge?
      if ((tiles.get(int(currentTile -pow(size,2))).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(int(currentTile -pow(size,2))).value)){
        println("5");
        tiles.get(int(currentTile -pow(size,2))).sumDist = tiles.get(currentTile).sumDist + tiles.get(int(currentTile -pow(size,2))).value;
        tiles.get(int(currentTile -pow(size,2))).pTile = currentTile;
        tiles.get(int(currentTile -pow(size,2))).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(int(currentTile -pow(size,2))).pos.x, tiles.get(int(currentTile -pow(size,2))).pos.y, tiles.get(int(currentTile -pow(size,2))).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    
    
    //Tile away
    if (currentTile +pow(size,2) <= (pow(size,3)-1) && tiles.get(currentTile).checkedFrom != currentTile +pow(size,2)){ //<---------------- Are you at the left edge?
      if ((tiles.get(int(currentTile +pow(size,2))).sumDist) > (tiles.get(currentTile).sumDist + tiles.get(int(currentTile +pow(size,2))).value)){
        println("6");
        tiles.get(int(currentTile +pow(size,2))).sumDist = tiles.get(currentTile).sumDist + tiles.get(int(currentTile +pow(size,2))).value;
        tiles.get(int(currentTile +pow(size,2))).pTile = currentTile;
        tiles.get(int(currentTile +pow(size,2))).checkedFrom = currentTile;
        
        pushMatrix();
        fill(255,0,0);
        translate(tiles.get(int(currentTile +pow(size,2))).pos.x, tiles.get(int(currentTile +pow(size,2))).pos.y, tiles.get(int(currentTile +pow(size,2))).pos.z);
        box(colLength);
        popMatrix();
      }
    }
    
    
    
    tiles.get(currentTile).checked = true;
    //---------
    //break;
    count ++; //<----TEMP //<>//
    
  //}
}
