
/* **********************************************************************

                              CONTROLS
                         
   ********************************************************************** */
   
   
void keyPressed() {

  if (key == 's') {
    saveFrame(SKETCH_NAME+"_"+year()+month()+day()+hour()+minute()+second()+millis()+".png");
  }
  if (key == 'c') {
    breedParents();
  }
  if (key == 'h') {
   switchHelp();
  }
  if (key == 'x') {
    sound_bank.saveBank();
  }
  if (key == 'y') {
    sound_bank.loadBank();
  }
  if (key == 'l') {
    timeline_is_playing = !timeline_is_playing;
  }
  if (key == 't') {
    timeline.saveTimeline();
  }
  if (key == 'r') {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      z.randomGenotype();
    }
  }
  if (key == 'm') {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      z.mutateGenotype(0.05);
    }
  }
  if (key == 'n') {
    timeline_is_playing = false;
    //timeline.endReached();
    //timeline.initBySoundBank(sound_bank);
    timeline.reInit(sound_bank);
    //timeline.redraw_sounds = true;
  }  
  if (key == 'o') {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      float[] gen = new float[max_params];
      gen = z.getGenotype();
      int zmode = z.mode;
      if (zmode == 0) zmode = mode;
      sendGenotypeOsc(gen, zmode);
    } else {
      int sbmin = sound_bank.mouseIn(float(mouseX), float(mouseY));
      if ( sbmin > -1) {
        println("mouse_in" + sound_bank.mouseIn(float(mouseX), float(mouseY)));
        // play from bank
        float[] gen = new float[max_params];
        Orga z = (Orga) sound_bank.sounds.get(sbmin);
        gen = z.getGenotype();
        int zmode = z.mode;
        print("envoi genotype depuis la banque");
        sendGenotypeOsc(gen, zmode);
      }
    }
  }
  if (key == 'd') {
    int sbmin = sound_bank.mouseIn(float(mouseX), float(mouseY));
    if ( sbmin > -1) {
      println("supprimer" + sbmin);
      //sound_bank.sounds.remove(sbmin);
      sound_bank.removeSound(sbmin);
      sound_bank.redraw_bank = true;
    }
  }
  
  if (key == 'a') {
    if (parentA.alive) {
      //Orga z = (Orga) zorgs.get(zorg_selected);
      float[] gen = new float[max_params];
      gen = parentA.getGenotype();
      sendGenotypeOsc(gen, mode);
    }
  }
  if (key == 'b') {
    if (parentB.alive) {
      //Orga z = (Orga) zorgs.get(zorg_selected);
      float[] gen = new float[max_params];
      gen = parentB.getGenotype();
      sendGenotypeOsc(gen, mode);
    }
  }
  
  if (key == 'k') {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      float[] gen = new float[max_params];
      gen = z.getGenotype();
      int zmode = z.mode;
      if (zmode == 0) zmode = mode;
      //sendGenotypeOsc(gen, zmode);
      sound_bank.addSound(gen, zmode);
      sound_bank.redraw_bank = true;
    }
  }
  
  if (key == '0') { mode = 0; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '1') { mode = 1; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '2') { mode = 2; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '3') { mode = 3; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '4') { mode = 4; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '5') { mode = 5; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '6') { mode = 6; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '7') { mode = 7; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '8') { mode = 8; sendModeOsc(mode); redraw_colorbar = true; } 
  if (key == '9') { mode = 9; sendModeOsc(mode); redraw_colorbar = true; } 
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      for (int i = 0; i < max_params; i++) {
        parentA.genotype[i] = z.genotype[i];
      }
      parentA.alive = true;
    } else {
      int sbmin = sound_bank.mouseIn(float(mouseX), float(mouseY));
      if ( sbmin > -1) {
        Orga z = (Orga) sound_bank.sounds.get(sbmin);
        for (int i = 0; i < max_params; i++) {
          parentA.genotype[i] = z.genotype[i];
        }
        parentA.alive = true;
      }
    }
  } else if (mouseButton == RIGHT) {
    if (zorg_selected > -1) {
      Orga z = (Orga) zorgs.get(zorg_selected);
      for (int i = 0; i < max_params; i++) {
        parentB.genotype[i] = z.genotype[i];
      }
      parentB.alive = true;
    } else {
    int sbmin = sound_bank.mouseIn(float(mouseX), float(mouseY));
      if ( sbmin > -1) {
        Orga z = (Orga) sound_bank.sounds.get(sbmin);
        for (int i = 0; i < max_params; i++) {
          parentB.genotype[i] = z.genotype[i];
        }
        parentB.alive = true;
      }
    }
  }
}
