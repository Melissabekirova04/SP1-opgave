class Country {
  String name;
  PImage flag;
  Group currentGroup; // reference til gruppen (sættes i Group-konstruktøren)

  Country(String name) {
    this.name = name;
    this.flag = loadImage(name + ".png"); 
  }

  void display(int x, int y, int w, int h) {
    // Hvid baggrund for landet med kant
    stroke(borderColor);
    strokeWeight(5);
    fill(255);
    rect(x, y, w, h);

    // Tegn flag (hvis fundet)
    int flagW = 0;
    if (flag != null) {
      int flagH = h - 6; 
      flagW = (int)(flagH * 2.0);
      image(flag, x + 3, y + 3, flagW, flagH);
    }

    // Landets navn
    fill(countryTextColor);
    textAlign(LEFT, CENTER);
    int textX = x + 10 + flagW + 8; // placér teksten efter flagget
    text(name.toUpperCase(), textX, y + h/2);

    // --- Lille farvet bjælke ude i højre side ---
    int barW = 14; 
    noStroke();
    color sideColor = (currentGroup != null && currentGroup.isTop) ? topGroupColor : bottomGroupColor;
    fill(sideColor);
    rect(x + w - barW, y+2, barW, h-4);
  }
}
