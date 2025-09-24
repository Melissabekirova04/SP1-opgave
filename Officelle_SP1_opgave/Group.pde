class Group {
  String title;
  Country[] countries;
  boolean isTop;   

  Group(String title, String[] names, boolean isTop) {
    this.title = title;
    this.isTop = isTop;
    countries = new Country[names.length];
    for (int i = 0; i < names.length; i++) {
      countries[i] = new Country(names[i]);
      countries[i].currentGroup = this;  
    }
  }

  void display(int x, int y, int w, int h) {
    // Gruppens navn
    fill(isTop ? topGroupColor : bottomGroupColor);
    textAlign(CENTER, CENTER);
    text(title, x + w/2, y - h/2 - 15);

    // Alle landene i gruppen
    for (int i = 0; i < countries.length; i++) {
      int yPos = y + i * (h + spacing);
      countries[i].display(x, yPos, w, h);
    }
  }
}
