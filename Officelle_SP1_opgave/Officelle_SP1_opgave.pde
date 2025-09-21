// --- Indstillinger ---
int yStart = 80;
int w = 420;
int h = 40;
int spacing = 3;
int gruppeSpacing = 60;

int venstreKolonneX = 0;   // helt ud til kanten
int højreKolonneX = 470;

color bgColor = #2E3E6A;
color borderColor = #2E3E6A;
color topGroupColor = #3FD0FA;
color bottomGroupColor = #EBF227;
color countryTextColor = #102030;

// --- Data ---
String[][] grupper = {
  {"Russia", "SaudiArabia", "Egypt", "Uruguay"},
  {"Portugal", "Spain", "Morocco", "Iran"},
  {"France", "Australia", "Peru", "Denmark"},
  {"Argentina", "Iceland", "Croatia", "Nigeria"}
};

String[] groupTitles = {"GROUP A", "GROUP B", "GROUP C", "GROUP D"};

// --- Globale variabler ---
Group[] allGroups;

PFont boldFont;

void setup() {
  size(900, 490);
  boldFont = createFont("AppleGothic-48", 23); 
  textFont(boldFont);
  noLoop();


  // Opret grupper som objekter
  allGroups = new Group[grupper.length];
  for (int g = 0; g < grupper.length; g++) {
    boolean isTop = (g % 2 == 0); // A og C øverst → blå
    allGroups[g] = new Group(groupTitles[g], grupper[g], isTop);
  }
}

void draw() {
  background(bgColor);

  // Midterlinje
  stroke(255);
  strokeWeight(4);
  line(450, 0, 450, height);

  // Tegn alle grupper
  for (int g = 0; g < allGroups.length; g++) {
    int xPos = (g < 2) ? venstreKolonneX : højreKolonneX;
    int yOffset = yStart + (g % 2) * (allGroups[g].countries.length * (h + spacing) + gruppeSpacing);
    allGroups[g].display(xPos, yOffset, w, h);
  }
}
