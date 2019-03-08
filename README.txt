Différences entre SDL et SDL 2.
  Mis à part l'age "avancé" de SDL premier du nom, et l'arrêt de son entretien 
  par ces crateurs, la majeure différence avec son succéseur (SDL 2), est que ce 
  dernier est supporter par un plus grand nombres de Système d'Exploitation et bénéficie 
  de plus de possibilitées  de réalisation.
 
Pourquoi SDL_image?
  Dans son format d'origine, SDL 2 ne gère que les images au format Bitmap. 
  L'ajout de la bibliothèque SDL2_image permet au compilateur de gérer les formats d'images autres.
  (Jpg, Png, etc.).
  
Etat du développement.
  Le programme affiche des formes géométriques en là présence de deux lignes rouges formant 
  un "viseur" fixer sur le Bitmap du Rider fournit avec les assets. L'Hélicoptère est fonctionnel,
  soit déplaçable et animé.
  
Commentaire et ressentis à chaud.
  L'ensemble de SDL2 à été compliquer à prendre en mains. Le site de tutoriel distribue beaucoup d'informations
  en très peu de temps, ainsi que de nombreuses lignes de commandes et il à été compliqué de cerner en une fois
  ce qui était vraiment utile pour le projet. 
  Le plus complèxe à également été de comprendre comment marche la mise en place des frames et l'affichage de l'hélico,
  les explications étant encore une fois asser floues.
  
Notes:
  L'hélicoptère ce déplace en se servant de ZQSD.
  Il est possible qu'il faille fermer et relancer le programme pour afficher correctement les images
  si celui-ci est lancer depuis FPC.
