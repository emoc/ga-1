
class Orga {
  
  float[] genotype = new float[16]; // genotype, 16 parametres
  int mode = 0; // le mode général (0) par défaut
  float diametre_max = 112;
  float x, y;
  boolean alive;
  boolean selected;
  float time_line_value;
  float time_line_height;
  boolean redraw_me = true;

  Orga(float _x, float _y, boolean _alive) {
    x = _x;
    y = _y;
    alive = _alive;
    selected = false;
    randomGenotype();
  }
  
  Orga(float[] _genotype, int _mode) {
    for (int i = 0; i < genotype.length; i++) {
      genotype[i] = _genotype[i];
    }
    mode = _mode;
    alive = false;
    selected = false;
  }
  
  Orga(float[] _genotype, int _mode, float _tlv, float _tlh) {
    for (int i = 0; i < genotype.length; i++) {
      genotype[i] = _genotype[i];
    }
    mode = _mode;
    alive = false;
    selected = false;
    time_line_value = _tlv;
    time_line_height = _tlh;
  }
  
  void randomGenotype() {
    for (int i = 0; i < genotype.length; i++) {
      genotype[i] = float(int(random(0,10001))) / 10000;
    }
  }
  
  void mutateGenotype(float mutationRate) {
    for (int i = 0; i < genotype.length; i++) {
      float nv = float(round((genotype[i] + random(-mutationRate, mutationRate)) * 10000)) / 10000;
      if (nv < 0) nv = 1 - nv;
      nv = nv % 1;
      genotype[i] = nv;
    }
  }
  
  void drawOrga() {
    if (redraw_me) {
      noStroke(); ellipseMode(CENTER);
      fill(1);
      ellipse(x, y, diametre_max+6, diametre_max+6);
      if (alive) {
        if (selected) {
          fill(0.03, 0.84, 0.99);
          ellipse(x, y, diametre_max+4, diametre_max+4);
        }
        for (int i = (genotype.length - 1); i >= 0; i--) {
          fill(0, 0, genotype[i]);
          float d = (diametre_max / genotype.length) * (i+1);
          ellipse(x, y, d, d);
        }
      } else {
        fill(0.29, 0.38, 0.98);
        ellipse(x, y, diametre_max, diametre_max);
      }
      //redraw_me = false;
    }
  }
  
  void showParams() {
    if (redraw_me) {
      fill(1); rect(840, 110, 200, 260);
      fill(0,0,0);
      float xparam = 840;
      float yparam = 150;
      for (int i = 0; i < genotype.length; i++) {
        text("p" + i + " : " + genotype[i], xparam, yparam + 14*i);
      }
      redraw_me = false;
    }
  }
  
  void setGenotype(float[] _genotype) {
    for (int i = 0; i < genotype.length; i++) {
      genotype[i] = _genotype[i];
    }
  }
  
  float[] getGenotype() {
    return genotype;
  }
  
  boolean testMouse(float _mx, float _my) {
    if (dist(_mx, _my, x, y) < (diametre_max / 2)) {
      selected = true;
      redraw_me = true;
    }
    else selected = false;
    redraw_me = true; // toujours vrai! sinon ça n'efface pas le cercle de sélection...
    
    return selected;
  }
} 

