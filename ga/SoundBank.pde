class SoundBank {
  
  float x_start, y_start;
  float x_size = 34, y_size = 34;
  int x_length = 8, y_length = 8;
  ArrayList sounds = new ArrayList();
  int index = 0;
  int max_index = x_length * y_length - 1;
  boolean redraw_bank = true;
  
  SoundBank(float _x_start, float _y_start) {
    x_start = _x_start;
    y_start = _y_start;
  }
  
  void drawBank() {
    if (redraw_bank) {
      fill(1); rect(x_start, y_start, x_size * x_length, y_size * y_length);
      int in_bank = sounds.size();
      int in_bank_sound = 0;
      for (int i = 0; i < y_length; i++) {
        for (int j = 0; j < x_length; j++) {
          
          float x = x_start + (j * x_size);
          float y = y_start + (i * y_size);
          stroke(0, 0, 0.6, 1); noFill(); strokeWeight(1);
          rect(x, y, x_size, y_size);
          if (in_bank_sound < in_bank) {
            drawBankSound(in_bank_sound, x, y);
          }
          in_bank_sound ++;
        }
      }
      redraw_bank = false;
    }
    //println("banksize" + sounds.size());
  }
  
  void drawBankSound(int _id, float _x, float _y) {
    Orga z = (Orga) sounds.get(_id);
    //ellipseMode(CORNER); noStroke(); fill(0, 1, 0.5, 1);
    noStroke(); ellipseMode(CENTER);
    
    fill(getModeColor(z.mode));
    rect(_x + 1, _y + 1, x_size - 1, y_size - 1);
    for (int i = (z.genotype.length - 1); i >= 0; i--) {
      fill(0, 0, z.genotype[i]);
      float d = ((x_size - 2) / z.genotype.length) * (i+1);
      ellipse(_x + 1 + ((x_size - 2) / 2), _y + 1 + ((y_size - 2) / 2), d, d);
    }
    //ellipse(_x + 1, _y + 1, x_size - 1, y_size - 1);
  }
  
  void addSound(float[] _genotype, int _mode) {
    if (index <= max_index) {
      sounds.add( new Orga(_genotype, _mode));
      index++;
    } else {
      print("banque pleine");
    }
  }
  
  void removeSound(int _id) {
    sound_bank.sounds.remove(_id);
    index--;    
  }
  
  int mouseIn(float _mx, float _my) {
    int mouse_in = -1;
    if (     (_mx >= x_start) 
          && (_mx <= x_start + (x_size * x_length))
          && (_my >= y_start)
          && (_my <= y_start + (y_size * y_length)) )  {
       int nbx = int(( _mx - x_start ) / x_size);
       int nby = int(( _my - y_start ) / y_size);
       mouse_in = nby * y_length + nbx;
    }
    
    if (mouse_in > sounds.size() - 1) {
      mouse_in = -1;
    }
    return mouse_in;
  }
  
  void loadBank() {
    if (sounds.size() > 0) {
      for (int i = sounds.size() - 1; i >= 0; i--) {
        sounds.remove(i);
      }
    }
    String filename = "banque_de_son.txt";
    File f = new File(dataPath(filename));
    if (f.exists()) {
      println("le fichier 'banque_de_son.txt' existe, il va être chargé");
      String lines[] = loadStrings("./data/banque_de_son.txt");
      for (int i=0; i < lines.length; i++) {
        println(lines[i]);
        String[] val = split(lines[i], ';');
        int _mode;
        float[] _g = new float[16];

        _mode = Integer.parseInt(val[0]);
        _g[0]  = Float.parseFloat(val[1]);
        _g[1]  = Float.parseFloat(val[2]);
        _g[2]  = Float.parseFloat(val[3]);
        _g[3]  = Float.parseFloat(val[4]);
        _g[4]  = Float.parseFloat(val[5]);
        _g[5]  = Float.parseFloat(val[6]);
        _g[6]  = Float.parseFloat(val[7]);
        _g[7]  = Float.parseFloat(val[8]);
        _g[8]  = Float.parseFloat(val[9]);
        _g[9]  = Float.parseFloat(val[10]);
        _g[10] = Float.parseFloat(val[11]);
        _g[11] = Float.parseFloat(val[12]);
        _g[12] = Float.parseFloat(val[13]);
        _g[13] = Float.parseFloat(val[14]);
        _g[14] = Float.parseFloat(val[15]);
        _g[15] = Float.parseFloat(val[16]);

        sounds.add( new Orga(_g, _mode));
      }
    } else {
      println("pas de fichier 'zones.txt' à charger");
    }
  }
  
  void saveBank() {
    String fichier = "";
    for (int i = 0; i < sounds.size(); i++) {
      Orga z = (Orga) sounds.get(i);
      if (i > 0) fichier += " ";
      fichier += z.mode + ";"; // x + ";" + zs.y + ";" + zs.rayon;
      for (int j = 0; j < z.genotype.length; j++) { 
        if (j > 0) fichier += ";";
        fichier += z.genotype[j];
      }
    }
    String[] liste = split(fichier, ' ');
    saveStrings("./data/banque_de_son.txt", liste);
    
    println("fichier banque_de_sons.txt enregistré");
  }
}
