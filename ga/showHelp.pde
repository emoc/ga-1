void showHelp() { // TODO !
  fill(0, 0, 1, 1); stroke(0, 0, 0, 1); strokeWeight(1);
  rect (100, 100, 550, 550);
  String notes = "";
  notes += "\n";
  notes += "clic gauche : choisir comme parent A\n\n";
  notes += "clic droit : choisir comme parent B\n\n";
  notes += "s : sauver une copie d'écran\n\n";
  notes += "c : croiser les parents et créer une nouvelle population\n\n";
  notes += "h : afficher / cacher l'aide\n\n";
  notes += "x : sauver la banque de sons (banque_de_sons.txt)\n\n";
  notes += "y : charger la dernière banque de sons enregistrée\n\n";
  notes += "l : jouer la timeline (2 minutes)\n\n";
  notes += "n : réinitialiser la timeline\n\n";
  notes += "t : enregistrer la timeline (timeline.txt)\n\n";
  notes += "r : remplacer par un génotype random\n\n";
  notes += "m : muter le génotype (5%)\n\n";
  notes += "o : jouer immédiatement ce génotype\n\n";
  notes += "d : enlever ce son de la banque\n\n";
  notes += "a : jouer immédiatement le parent A\n\n";
  notes += "b : jouer immédiatement le parent B\n\n";
  notes += "k : ajouter à la banque\n\n";
  notes += "b : jouer immédiatement le parent B\n\n";
  notes += "b : jouer immédiatement le parent B\n\n";
  notes += "0...9 : changer le mode de créatino sonore\n\n\n\n";

  
  fill(0, 0, 0, 1); stroke(0, 0, 0, 1);
  text(notes, 120, 115, 550, 550);
}
