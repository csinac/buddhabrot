int ItoW(float i)
{
  return int(((i+2)/4)*outputSize);
}


float val;
void fitExposureAndDraw()
{
  output.beginDraw();
  output.loadPixels();
  float maxV = 0;
  float minV = Float.MAX_VALUE;
  for(int i = 0; i<outputSize*outputSize; i++)
  {
    maxV = max(maxV, exposure[i]);
    if(exposure[i] != 0) minV = min(minV, exposure[i]);
  }
  for(int i = 0; i<outputSize*outputSize; i++)
  {
    if(brighten)
    {
      cr = int((exposure[i]/maxV)*255*brightness);
      if(cr > 255) cr = 255;
      
      output.pixels[i] = color(cr);
    }
    else
    {
      val = (exposure[i]-minV);
      if(val < 0) val = 0;
      
      val = val/(maxV-minV);
      val = val*255;
      
      output.pixels[i] = color(int(val));
    }
  }
  output.updatePixels();
  output.endDraw();
  image(output, 0,0,width, height);
}

void keyPressed()
{
  if(key == ' ')
  {
    showProgress = !showProgress;
  }
  else if(key == 's' || key == 'S') {
    output.save("buddhabrot mi_" + mandelIteration + " bi_" + buddhaIteration + " " + timestamp() + ".png");
  }
}

String timestamp() {
  return year() + "-"  + month() + "-" + day() + "_" + hour() + "-" + minute() + "-" + second();
}
