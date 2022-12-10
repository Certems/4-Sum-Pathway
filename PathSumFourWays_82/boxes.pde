class tile{
  
  int checkedFrom;
  
  int value;
  int pTile;
  int sumDist;
  boolean checked;
  PVector pos; 
  
  int ID;
  
  tile(int assignedNumber, PVector position){
    value = assignedNumber;
    pos = new PVector();
    pos.x = position.x;
    pos.y = position.y;
    pTile = 0;
    sumDist = 999999999;
    //ID = floor((pos.x * size)+pos.y);
    checked = false;
    checkedFrom = 0;
  }
  void update(){
    pushStyle();
    noFill();
    rect(int(pos.x), int(pos.y), colLength, colLength);
    popStyle();
    pushStyle();
    fill(0);
    text(value, pos.x+colLength/2, pos.y+rowLength/2); 
    popStyle();
  }
}
