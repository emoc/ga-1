class Timeline {
  
  float x, y;
  float x_size = 850; // pixels
  boolean is_playing = false;
  ArrayList sounds_tl = new ArrayList();
  float playhead = 0;
  float playhead_last;
  float timeline_length = 60000; // millisec.
  float timeline_start;
  float now, last;
  boolean redraw_sounds = true;
  boolean redraw_timeline = true;

  
  Timeline(float _x, float _y) {
    x = _x;
    y = _y;  
  }
  
  void initBySoundBank(SoundBank sb) {
    for (int i = 0; i < sb.sounds.size(); i++) {
      Orga z = (Orga) sb.sounds.get(i);
      float time = random(1001) / 1000;
      float tlh = random(40, 120);
      sounds_tl.add( new Orga(z.genotype, z.mode, time, tlh));
    }
  }
  
  void reInit(SoundBank sb) {
    is_playing = false;
    sounds_tl = new ArrayList();
    playhead = 0;
    
    for (int i = 0; i < sb.sounds.size(); i++) {
      Orga z = (Orga) sb.sounds.get(i);
      float time = random(1001) / 1000;
      float tlh = random(40, 120);
      sounds_tl.add( new Orga(z.genotype, z.mode, time, tlh));
    }
    redraw_sounds = true;
  }
  
  void doActions() {
    if (redraw_timeline) {
      drawTimeline();
      redraw_timeline = false;
    }
    if (is_playing) {
      drawPlay();
      redraw_timeline = true;
    }
    if (redraw_sounds) {
      drawSounds();
      redraw_sounds = false;
    }
  }
  
  void drawTimeline() {
      fill(0, 0, 0.6, 1);
      noStroke();
      rectMode(CORNER);
      rect (x, y, x_size, 20);
  }
  
   void drawPlay() {
    fill(0, 1, 0.6, 1);
    noStroke();
    rectMode(CORNER);
    rect (x, y, x_size * playhead, 20);
  }
  
  void drawSounds() {
    fill(1); rect(x - 30, y - 140, x_size + 60, 140);
    for (int i = 0; i < sounds_tl.size(); i++) {
      //float yh = random(40, 120);
      Orga z = (Orga) sounds_tl.get(i);
      float xs = z.time_line_value * x_size;
      float yh = z.time_line_height;
      //stroke(0, 0, 0, 1); noFill();
      //line(x + xs, y , x + xs, y - 50); 
      noStroke(); fill(getModeColor(z.mode));
      beginShape();
        vertex(x + xs - 4, y - yh);
        vertex(x + xs + 4, y - yh);
        vertex(x + xs, y);
      endShape(CLOSE);
      noStroke(); ellipseMode(CENTER);
    
      fill(getModeColor(z.mode));
      float xx = x + xs;
      float yy = y - yh;
      ellipse(xx, yy, 36, 36); //rect(_x + 1, _y + 1, x_size - 1, y_size - 1);
      for (int j = (z.genotype.length - 1); j >= 0; j--) {
        fill(0, 0, z.genotype[j]);
        float d = (32 / z.genotype.length) * (j+1);
        ellipse(xx, yy, d, d);
      }
    }
  }
  
  void start(float ms) {
    is_playing = true;
    timeline_start = ms;
    last = ms;
    now = ms;
    playhead = 0;
    playhead_last = 0;
  }
  
  void play(float ms) {
    now = ms - last;
    playhead = playhead + (now / timeline_length);
    //println("now " + now + " last " + last + " ms " + ms + " playhead " + playhead + " playhead_last " + playhead_last);
    playSounds(playhead_last, playhead);
    playhead_last = playhead;
    last = ms;
  }
  
  boolean endReached() {
    boolean er = false;
    if (playhead > 1) { // STOP
      is_playing = false;
      playhead = 0;
      playhead_last = 0;
      er = true;
    }
    return er;
  }
  
  void playSounds(float ph_start, float ph_end) {
    for (int i = 0; i < sounds_tl.size(); i++) {
      Orga z = (Orga) sounds_tl.get(i);
      if ( (z.time_line_value >= ph_start) &&  (z.time_line_value < ph_end) ) {
        sendGenotypeOsc(z.genotype, z.mode);
      }
    }
  }
  // TODO
  
  void sendGenotypeOsc(float[] _genotype, int mode) {
  sendModeOsc(mode);
  OscMessage message = new OscMessage("/params");
  for (int i = 0; i < max_params; i++) {
    message.add(_genotype[i]); 
  }
  osca.send(message, loc); 
  }

  void sendModeOsc(int mode) {
    OscMessage message = new OscMessage("/mode");
    message.add(mode); 
    osca.send(message, loc); 
  }
  
  void saveTimeline() {
    String fichier = "";
    for (int i = 0; i < sounds_tl.size(); i++) {
      Orga z = (Orga) sounds_tl.get(i);
      if (i > 0) fichier += " ";
      fichier += z.time_line_value + ";";
      fichier += z.mode + ";"; // x + ";" + zs.y + ";" + zs.rayon;
      for (int j = 0; j < z.genotype.length; j++) { 
        if (j > 0) fichier += ";";
        fichier += z.genotype[j];
      }
    }
    String[] liste = split(fichier, ' ');
    saveStrings("./data/timeline.txt", liste);
    
    println("fichier timeline.txt enregistré");
  }
  
}
