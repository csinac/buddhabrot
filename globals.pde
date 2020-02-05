PGraphics output;
int outputSize = 2000;
int windowSize = 600;

int[] exposure = new int[outputSize*outputSize];
int[] mandel = new int[outputSize*outputSize];
int mandelIteration = 10;
int buddhaIteration = 10;

int samples = 10000;
boolean brighten = false;
float brightness = 2;

//final coloring
int cr, cg, cb;

Thread[] t;
int threadCount = 10;
boolean showProgress = true;
