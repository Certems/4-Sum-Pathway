int gridNum = -1;
int rowNum = 0;
int matrixSize(){
  size = 0;
  while(true){
    try {
      lines = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      lines = null;
    }
    if (lines == null){
      break;
    }    
    else{
      if (lines.equals("-")){ //<---- Make a new grid set (which holds rows[1], which holds numbers[2])
        numbers.add(new ArrayList<ArrayList<Integer>>());
        gridNum++;
        rowNum = 0;
      }
      else{
        numbers.get(gridNum).add(new ArrayList<Integer>());
        String[] cLine = split(lines, ",");
        for (int i=0; i < cLine.length; i++){
          String cNum = cLine[i];
          numbers.get(gridNum).get(rowNum).add(int(cNum));
        }
        rowNum++;
        size++;
      }
    }
  }
  //println(numbers);
  //println(size);
  return (gridNum +1);
}
