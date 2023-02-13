# Instagrid-P4

<img width="295" alt="Capture d’écran 2022-02-06 à 13 17 42" src="https://user-images.githubusercontent.com/48012094/152680392-d1b3a474-36df-4015-a9b5-ac8a940fe3ed.png">

Application Instagrid de partage d'images

## Description de l'application

Résumé du Cahier des charges du projet :

Instagrid est une application iPhone permettant aux utilisateurs de combiner des photos en
choisissant parmi plusieurs dispositions. Le résultat final est au format carré et partageable
avec ses amis.

Les photos sont organisés selon une disposition que l’utilisateur peut choisir. Les trois
dispositions disponibles sont rappelées ci-dessous : 

<img width="254" alt="Capture d’écran 2023-02-13 à 07 13 51" src="https://user-images.githubusercontent.com/48012094/218384222-d3491ed6-99c1-4f67-89e8-921944ebe026.png">

En tapant sur l’une de ces dispositions :
1. La précédente disposition sélectionnée n’est plus marquée comme sélectionnée.
2. La sélection tapée est marquée comme sélectionnée.
3. La grille centrale (en bleu foncé) s’adapte en fonction de la nouvelle disposition.

En tapant sur un bouton plus, l’utilisateur a accès à sa photothèque et peut choisir une des
photos de son téléphone. Une fois choisie, celle ci vient prendre la place de la case
correspondante au bouton plus tapé.

<img width="324" alt="Capture d’écran 2023-02-13 à 07 15 32" src="https://user-images.githubusercontent.com/48012094/218384484-4bf8d6d4-6bf7-4698-89bc-6c12ef76b835.png">

La photo est centrée, sans être altérée (les proportions sont maintenues) et doit prendretout l’espace possible.
Si l’utilisateur clique sur une photo dans la grille, il peut choisir dans la photothèque une nouvelle image pour la remplacer.

L’utilisateur peut partager la création qu’il vient de réaliser. Pour cela il peut réaliser un swipe vers le haut (en mode portrait) ou vers la gauche (en mode paysage).

Le swipe lance une animation qui fait glisser la grille principale vers le haut (ou vers la
gauche) jusqu’à disparaître de l’écran.

Une fois l’animation terminée, la vue UIActivityController s’affiche et permet à l’utilisateur
de choisir son application préférée pour partager sa création.

<img width="252" alt="Capture d’écran 2023-02-13 à 07 17 48" src="https://user-images.githubusercontent.com/48012094/218384839-bb9f4fcd-6fb9-4759-91a6-7e53da2e0070.png">

Réalisé en Formation avec OpenClassRooms

## Compétences acquises

- Mettre en place une architecture adaptée à son projet
- Interpréter les gestes sur un écran tactile
- Créer un design responsive à partir d'un mockup
