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
    pos.z = position.z;
    pTile = 0;
    sumDist = 999999999;
    //ID = floor((pos.x * size)+pos.y);
    checked = false;
    checkedFrom = 0;
  }
  void update(){
    pushMatrix();
    noFill();
    translate(pos.x, pos.y, pos.z);
    box(colLength);
    popMatrix();
    pushStyle();
    fill(0);
    text(value, pos.x, pos.y, pos.z); 
    popStyle();
  }
}
