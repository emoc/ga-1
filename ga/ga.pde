/*
  GA-1 / emoc / oct. 2010 -> apr. 2013 / processing 2.0b6 
  a genetic workbench to experiment with sounds 
  
  
  **********************************************************************
  
  Copyright (C) <2013>  <Pierre Commenge>
  P. Commenge - http://emoc.org
  oscP5 library by Andreas Schlegel - http://www.sojamo.de/

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
  **********************************************************************
  
  16 parameters are sent by OSC, each normalized from 0 to 1
  10 modes to switch
  
  OSC messages
  /mode i
  /params f f f f f f f f f f f f f f f f 
  
*/


import oscP5.*;
import netP5.*;

OscP5 osca;
NetAddress loc;
int OscOutPort = 57120;                         // <-- OSC OUT PORT

String SKETCH_NAME = "ga";
PFont font;

ArrayList zorgs = new ArrayList();
boolean init = true;
Orga parentA = new Orga(205, 75, false);
Orga parentB = new Orga(335, 75, false);
int zorg_selected = -1;
int max_params = 16;

int mode = 5;
boolean help_visible = false;

SoundBank sound_bank = new SoundBank(550, 150);
Timeline timeline = new Timeline(50, 670);
boolean timeline_is_playing = false;

color[] color_modes = new color[10];
boolean redraw_colorbar = true;
boolean redraw_background = true;

void setup() {
  size(950, 700);
  smooth();
  colorMode(HSB, 1.0);
  color_modes[0] = color(0.0, 1.0, 1.0, 1.0);
  color_modes[1]=color(0.1, 1.0, 1.0, 1.0);
  color_modes[2]=color(0.2, 1.0, 1.0, 1.0);
  color_modes[3]=color(0.3, 1.0, 1.0, 1.0);
  color_modes[4]=color(0.5, 1.0, 1.0, 1.0);
  color_modes[5]=color(0.55, 1.0, 1.0, 1.0);
  color_modes[6]=color(0.6, 1.0, 1.0, 1.0);
  color_modes[7]=color(0.7, 1.0, 1.0, 1.0);
  color_modes[8]=color(0.8, 1.0, 1.0, 1.0);
  color_modes[9]=color(0.9, 1.0, 1.0, 1.0);
  font = loadFont("OhLaLa-10.vlw");
  osca = new OscP5(this, 12000);
  loc = new NetAddress("127.0.0.1", OscOutPort);
  frameRate(5);
  
}



void draw() {
  if (redraw_background) {
    background(1);
    redraw_background = false;
  }
  textFont(font, 10);
  
  if (init) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 3; j++) {
        float _x = 130*i + 75;
        float _y = 130*j + 75 + 130;
        zorgs.add( new Orga(_x, _y, true));
      }
    }
    sound_bank.loadBank();
    timeline.initBySoundBank(sound_bank);
    init = false;
  }
  
  if (timeline_is_playing) {
    if (timeline.is_playing == false) { // not already playing
      timeline.start(millis());
    } else {
      if (timeline.endReached()) timeline_is_playing = false;
      else timeline.play(millis());
    }
  }
  
  // afficher la banque de sons
  sound_bank.drawBank();
  
  // afficher tout
  zorg_selected = -1;
  for (int i = 0; i < 12; i++) {
    Orga z = (Orga) zorgs.get(i);
    if (z.testMouse(float(mouseX), float(mouseY))) zorg_selected = i;
    z.drawOrga();
  }
  
  // afficher les parents
  parentA.drawOrga();
  parentB.drawOrga();
  
  // afficher les parametres de la sélection
  if (zorg_selected > -1) {
    //println("selected : " + zorg_selected);
    Orga z = (Orga) zorgs.get(zorg_selected);
    z.showParams();
  }
  
  if (redraw_colorbar) {
    drawColorBar();
    redraw_colorbar = false;
  }
  timeline.doActions();
  
  showMode();
  if (help_visible) showHelp();
}








void showMode() {
  fill(1);
  rect(650, 48, 100, 15);
  fill(0, 0, 0);
  text("mode : " + mode, 650, 60);
}

color getModeColor(int _mode) {
  return color_modes[_mode];
}

void drawColorBar() {
  fill(1); rect(650, 0, 300, 40);
  float x_base = 650;
  stroke(0,0,1,1);
  for (int i = 0; i < 10; i++) { 
    fill(color_modes[i]); 
    rect(x_base + (i * 30), 0, 30, 30);
  }
  fill(0,0,0,1);
  rect(x_base + ((mode) * 30), 30, 30, 10);
}

void breedParents() {
  /* 30% de récupérer un gène du parentA
     30% de récupérer un gène du parentB
     40% de récupérer une moyenne des gènes */
  if (parentA.alive && parentB.alive) {
    float[] new_genotype = new float[max_params];
    for (int i = 0; i < 12; i++) {
      Orga z = (Orga) zorgs.get(i);
      for (int j = 0; j < max_params; j++) {
        float rr = random(1);
        if (rr <= 0.3) {
          new_genotype[j] = parentA.genotype[j];
        } else if ((rr > 0.3) && (rr <= 0.6)) {
          new_genotype[j] = parentB.genotype[j];
        } else {
          new_genotype[j] = mixGenes(parentA.genotype[j], parentB.genotype[j]);
        }
      }
      z.setGenotype(new_genotype); 
    }  
  }
}

float mixGenes(float va, float vb) {
  float vresult;
  if (abs(va - vb) < 0.5) {
    vresult = (va + vb) / 2;  
  } else {
    vresult = ((((1 - vb) + va) / 2) + vb) % 1;
    //println("cas 2, va :  " + va + ", vb : " + vb + ", vresult : " + vresult); 
  }
  return vresult;
} 


void sendGenotypeOsc(float[] _genotype, int mode) {
  sendModeOsc(mode);
  OscMessage message = new OscMessage("/params");
  String debug_osc = "";
  for (int i = 0; i < max_params; i++) {
    message.add(_genotype[i]); 
    debug_osc = debug_osc + " " + _genotype[i];
  }
  println("message à envoyer : " + debug_osc);
  osca.send(message, loc); 
}

void sendModeOsc(int mode) {
  OscMessage message = new OscMessage("/mode");
  message.add(mode); 
  osca.send(message, loc); 
}

void switchHelp() {
  help_visible = !help_visible;
  if (help_visible == false) redrawAll();
}

void redrawAll() {
  redraw_background = true;
  redraw_colorbar = true;
  timeline.redraw_sounds = true;
  timeline.redraw_timeline = true;
  sound_bank.redraw_bank = true;
  for (int i = 0; i < 12; i++) {
    Orga z = (Orga) zorgs.get(i);
    z.redraw_me = true;
  }
}
