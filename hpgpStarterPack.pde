
FancyFixtures fancyFixtures;
PGraphics ledGraphics;
PGraphics guiCanvas;

int[] gammatable = new int[256];
float gamma = 3.2; // 3.2 seems to be nice

void setup(){
    size(800, 800, P2D);
    frameRate(60);
    ledGraphics = createGraphics(width, height, P2D);
    guiCanvas = createGraphics(width, height, P2D);
    fancyFixtures = new FancyFixtures(this);
    fancyFixtures.loadFile("hpgp_dislodge.xml");
    makeGammaTable();

}

void draw(){
    background(0);
    guiCanvas.beginDraw();
    guiCanvas.clear();
    fancyFixtures.drawMap(guiCanvas);
    guiCanvas.endDraw();

    ledGraphics.beginDraw();
    ledGraphics.background(0);
    ledGraphics.fill(255,0,20);
    ledGraphics.ellipse(mouseX, mouseY, 20, 20);

    ledGraphics.endDraw();
    image(ledGraphics, 0, 0);

    fancyFixtures.update(ledGraphics);
    image(guiCanvas, 0, 0);
}

void makeGammaTable(){
    for (int i=0; i < 256; i++) {
        gammatable[i] = (int)(pow((float)i / 255.0, gamma) * 255.0 + 0.5);
    }
}
