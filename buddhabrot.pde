void setup()
{
  surface.setResizable(true);
  surface.setSize(windowSize, windowSize);
  
  output = createGraphics(outputSize, outputSize);
  
  t = new BuddhaThread[threadCount];
  
  for(int i = 0; i<threadCount; i++)
  {
    t[i] = new BuddhaThread();
    t[i].start();
  }
}

void draw()
{
  if(showProgress)
    fitExposureAndDraw();
}
