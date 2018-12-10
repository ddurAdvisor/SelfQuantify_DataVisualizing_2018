class Candidate {
  
  String name;
  int elecYear;
  int index;
  ArrayList<Category> categories = new ArrayList<Category>();
  
  Candidate(String _name, int _year, int _index) {
    name = _name;
    elecYear = _year;
    index = _index; 
  }
  
}
