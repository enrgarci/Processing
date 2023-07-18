/*
//
 // Autor: enrgarci
 // Date: 18-07-2023
 // Description: Google Maps like zoom implementation example
 // Scene is zoomed to the mouse position on MouseWheel
 */
void setup()
{
  size(400, 400);
  frameRate(24);
}

float zoom = 1;
float STEP = 0.01;
float ORIGINX = 150, ORIGINY = 120;
float ox = ORIGINX, oy = ORIGINY;
void draw()
{
  fill(255);
  background(255);
  rect(ox, oy, 100 * zoom, 100 * zoom);
  fill(255, 0, 0);
  rect(ox + 120 * zoom, oy + 120 * zoom, 100 * zoom, 100 * zoom);
  fill(0, 255, 0);
  rect(ox - 120 * zoom, oy + 120 * zoom, 100 * zoom, 100 * zoom);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  float prevZoom = zoom;

  if (e > 0)
    zoom += STEP;
  else if (e < 0)
    zoom -= STEP;
  ox = mouseX - (mouseX - ox) * zoom / prevZoom;
  oy = mouseY - (mouseY - oy) * zoom / prevZoom;
}
