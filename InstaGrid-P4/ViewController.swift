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
    @IBOutlet weak var pictureView: PictureView!
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
    
    /// Changement du style de mise en page de pictureView
    private func changeStyle(_ button: UIButton) {
        
        // Animation du changement de mise en page pour avoir un effet plus fluide lors du changement de layout
        UIView.animate(withDuration: 0.1) {
            
            // Modifiez la mise en page en fonction du bouton appuyé
            if button == self.buttonLeft { /// Si le bouton séléctionné est le bouton gauche
                self.pictureView.style = .layout1 /// On lui attribue le style du layout 1
            } else if button == self.buttonCenter {
                self.pictureView.style = .layout2
            } else if button == self.buttonRight {
                self.pictureView.style = .layout3
            }
        }
    }
    
    
    /// La pictureView a été swipée
    ///
    /// - parameter gesture: UISwipeGestureRecognizer
    /// UISwipeGestureRecognizer reconnaît un balayage lorsque l'utilisateur déplace le nombre spécifié de touches dans une direction autorisée suffisamment loin pour créer un balayage.
    @objc private func didSwipeView(_ gesture: UISwipeGestureRecognizer) {
        
        // Création des constantes pour la hauteur et la largeur de l'écran
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        // Declaration de CGAffineTranform
        let translationTransform: CGAffineTransform
        
        // Définissez la translationTransform en fonction de la direction du geste de balayage
        // Si l'utilisateur swipe vers le haut
        if gesture.direction == .up {
            translationTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
            // Sinon
        } else {
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }
        
        // Anime la transformation de pictureView
        UIView.animate(withDuration: 0.2, animations: {
            self.pictureView.transform = translationTransform
            self.swipeLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.iconSwipe.transform = CGAffineTransform(scaleX: 0, y: 0)
        }) { (succes) in
            // // Si l'animation est réussie, on lance la fonction convertAndShareView
            if succes {
                self.convertAndShareView()
            }
        }
    }
    
}

