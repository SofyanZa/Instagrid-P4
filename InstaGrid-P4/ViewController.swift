//
//  ViewController.swift
//  InstaGrid-P4
//
//  Created by SofyanZ on 04/02/2022.
//

import UIKit

class ViewController: UIViewController {

    
    // Connexion des éléments du storyboard grace au control drag
    // Outlets : Optionnal déballé car c'est toujours le cas avec les Outlets
    @IBOutlet weak var iconSwipe: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var buttonRight: UIButton!
    @IBOutlet weak var buttonCenter: UIButton!
    @IBOutlet weak var buttonLeft: UIButton!
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    // Ajout d'une variable permettant de savoir si une image a été tapée
    var viewTapped: UIImageView?
    
    // Informe le contrôleur de vue que sa vue a été ajoutée à une hiérarchie de vues
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // Appelé après le chargement de la vue du contrôleur en mémoire
    // Cette méthode est lancée directement dans notre application
        override func viewDidLoad() {
        super.viewDidLoad()
        
        // Créer et ajouter un outil de reconnaissance de gestes tactiles pour le 4 UIImageView
            // Les selectors permettent de passer en parametre une fonction
            // UiTapGesture permet de gerer les gestes de l'utilisateur sur l'ecran tactiles
            // Il a besoin de trois infos :
            /// Target : Le responsable de "gérer de geste", le controleur le plus souvent
            /// Action : Quelle action effectuer ?
            /// La view : quelle vue doit détecter le geste ?
            // La méthode contient un parametre donc je dois le préciser comme ceci : function(_:)
        let tapTopLeft = UITapGestureRecognizer(target: self, action: #selector(function(_:)))
        let tapTopRight = UITapGestureRecognizer(target: self, action: #selector(function(_:)))
        let tapBottomRight = UITapGestureRecognizer(target: self, action: #selector(function(_:)))
        let tapBottomLeft = UITapGestureRecognizer(target: self, action: #selector(function(_:)))
        topLeftImageView.addGestureRecognizer(tapTopLeft)
        topRightImageView.addGestureRecognizer(tapTopRight)
        bottomRightImageView.addGestureRecognizer(tapBottomRight)
        bottomLeftImageView.addGestureRecognizer(tapBottomLeft)
        
        
    }
    
    /// Un boutton UI a été tappé
    /// Fonction qui permet d'ajouter le style selectionné pour un bouton du Layout

    @IBAction func didTapeButton(_ sender: UIButton) {
        
        // Réinitialise tous les boutons dans le style sélectionné
        buttonRight.isSelected = false
        buttonCenter.isSelected = false
        buttonLeft.isSelected = false
        
        // Ajoute le style isselected à l'expéditeur et lui attribue le nouveau style pour désigné que ce bouton est séléctionné
        sender.isSelected = true
        
        // // Changement de style de l'imageVue
        changeStyle(sender)
    }
    
}

