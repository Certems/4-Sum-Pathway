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
      numbers.add(new ArrayList<Integer>());
      String[] cLine = split(lines, ",");
      for (int i=0; i < cLine.length; i++){
        String cNum = cLine[i];
        numbers.get(size).add(int(cNum));
      }
      //println(numbers.get(size));
    }
    size++;
  }
  return size;
}
