int yStart = 80;
int w = 400;
int h = 40;
int antal = 4;
int spacing = 3;
int gruppeSpacing = 60;

int venstreKolonneX = 10;
int højreKolonneX = 470;

String[][] grupper = {
  {"Russia", "SaudiArabia", "Egypt", "Uruguay"},
  {"Portugal", "Spain", "Morocco", "Iran"},
  {"France", "Australia", "Peru", "Denmark"},
  {"Argentina", "Iceland", "Croatia", "Nigeria"}
};

String[] groupTitles = {"GROUP A", "GROUP B", "GROUP C", "GROUP D"};

color bgColor = #234376;
color borderColor = #173a63;
color topGroupColor = #3FD0FA;
color bottomGroupColor = #EBF227;
color countryTextColor = #102030;

PImage[][] flags;

void setup() {
  size(900, 500);
  textSize(22);
  noLoop();

  // Indlæs alle flag én gang
  flags = new PImage[grupper.length][antal];
  for (int g = 0; g < grupper.length; g++) {
    for (int i = 0; i < antal; i++) {
      String filename = grupper[g][i] + ".png";
      flags[g][i] = loadImage(filename);
    }
  }
}

void draw() {
  background(bgColor);

  // Lodret linje i midten
  stroke(255);
  strokeWeight(2);
  line(450, 0, 450, height);

  for (int g = 0; g < grupper.length; g++) {
    int xPos = (g < 2) ? venstreKolonneX : højreKolonneX;
    int yOffset = yStart + (g % 2) * (antal * (h + spacing) + gruppeSpacing);

    // Gruppens navn
    fill((g % 2 == 0) ? topGroupColor : bottomGroupColor);
    textAlign(CENTER, CENTER);
    text(groupTitles[g], xPos + w/2, yOffset - h/2 - 15);

    for (int i = 0; i < antal; i++) {
      int yPos = yOffset + i * (h + spacing);

      // Firkant baggrund
      stroke(borderColor);
      strokeWeight(5);
      fill(255);
      rect(xPos, yPos, w, h);

      // Tegn flag
      if (flags[g][i] != null) {
        int flagH = h - 10;               // højde på flaget
        int flagW = (int)(flagH * 1.6);   // bredde (mere realistisk)
        image(flags[g][i], xPos + 10, yPos + 5, flagW, flagH);

        // Landets navn rykket efter flaget
        fill(countryTextColor);
        textAlign(LEFT, CENTER);
        text(grupper[g][i].toUpperCase(), xPos + 10 + flagW + 10, yPos + h/2);
      }
    }
  }
}
