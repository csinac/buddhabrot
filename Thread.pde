class BuddhaThread extends Thread
{
  boolean running;
  //mandelbrot z values
  float zx, zy, temp;
  //sample positions
  float sx, sy;

  BuddhaThread()
  {    
  }
 
  void start()
  {
    running = true;
    super.start();
  }
 
 
  void run()
  {
    while (running)
    {
      for(int i = 0; i<samples; i++)
      {
        sx = random(-2, 2);
        sy = random(-2, 2);
  
        if(pointEscapes(sx, sy))
        {
          plotEscapePath(sx, sy);
        }
      }

    }
  }
 
 
  void quit()
  {
    running = false;
    interrupt();
  }
  
  boolean pointEscapes(float x, float y)
{
  zx = 0;
  zy = 0;
  for(int i = 0; i<mandelIteration; i++)
  {
    temp = zx*zx - zy*zy + x;
    zy   = 2*zx*zy + y;
    zx   = temp;
        
    if((zx*zx + zy*zy) > 4)
    {
      return true;
    }    
  }  
  return false;
}

  void plotEscapePath(float x, float y)
  {
    zx = 0;
    zy = 0;
    for(int i = 0; i<buddhaIteration; i++)
    {
      temp = zx*zx - zy*zy + x;
      zy   = 2*zx*zy + y;
      zx   = temp;
          
      if((zx*zx + zy*zy) > 4)
      {
        return;
      }
      
      if(ItoW(zx) < outputSize && ItoW(zy) < outputSize && ItoW(zx) > 0 && ItoW(zy) > 0)
      {
        if(i > 1)
        exposure[ItoW(zx)*outputSize+ItoW(zy)]++;
      }
    }
    
    return;
  }

}
