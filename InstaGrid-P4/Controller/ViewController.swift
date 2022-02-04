//
//  ViewController.swift
//  InstaGrid-P4
//
//  Created by SofyanZ on 04/02/2022.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    // Set the light status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // Connexion des éléments du storyboard grace au control drag
    // Outlets : Optionnal déballé car c'est toujours le cas avec les Outlets
    @IBOutlet var themeView: Theme!
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
        
        // Vérification de l'orientation actuelle de l'appareil
        checkOrientation()
        
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
        let tapTopLeft = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        let tapTopRight = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        let tapBottomRight = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        let tapBottomLeft = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        topLeftImageView.addGestureRecognizer(tapTopLeft)
        topRightImageView.addGestureRecognizer(tapTopRight)
        bottomRightImageView.addGestureRecognizer(tapBottomRight)
        bottomLeftImageView.addGestureRecognizer(tapBottomLeft)
        
        
    }
    
    // Tells the receiver that a motion event has ended.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        // Check the type of motion event
        guard motion == .motionShake else { return }
        
        // Switch the theme
        themeView.theme = themeView.theme.toggleTheme
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
    
    /// Fonction permettant de convertir PictureView en image et de le partager
    private func convertAndShareView() {
        
        let image = pictureView.asImage()  /// On définit ce que sera l'image
        let imageToShare = [image]   /// On crée un tableau d'image que l'on pourra partager ensuite
        
        // UiActivityViewController permet l'envoie d'items via sms, mail, ou reseaux sociaux etc
        // plusieurs methodes sont associé à cet objet, on les utilise ci dessous
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        
        // Exclure certains types d'activités de la liste
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.openInIBooks ]
        
        // Partage ou annulation
        activityViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            // Activation showPictureView function
            self.showPictureView()
        }
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    /// PictureView réapparaît, notament apres avoir partagé une image
    private func showPictureView(){
        
        // Déplacer l'imageView à sa place initiale
        // identity transform efface efficacement notre vue de toute transformation prédéfinie, réinitialisant toutes les modifications qui ont été appliquées en modifiant la propriété
        pictureView.transform = .identity
        
        // Puis on remet l'echelle à 0
        pictureView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        // Animation de la vue de l'image et la réapparition de l'icône/étiquette avec un effet de rebond
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.pictureView.transform = .identity
            self.swipeLabel.transform = .identity
            self.iconSwipe.transform = .identity
            
            // Vérification de la position actuelle de l'appareil pour l'orientation de l'iconSwipe
            if UIDevice.current.orientation.isLandscape {
                self.iconSwipe.transform = CGAffineTransform(rotationAngle: (-CGFloat.pi/2))
            }
        })
    }
}

// MARK: - Orientation de l'appareil
extension ViewController {
    
    // Fonction qui Avertit le conteneur que la taille de sa vue est sur le point de changer
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // On lance la fonction de verification de l'orientation de l'appareil
        checkOrientation()
    }
    
    /// Fonction pour verifier l'orientation de l'appareil
    private func checkOrientation() {
        
        // Créeation des gestes de balayage
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView(_:)))
        
        // Change selon l'orientation
        /// Si l'appareil est orienté en mode paysage
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
            iconSwipe.transform = CGAffineTransform(rotationAngle: (-CGFloat.pi/2))
            swipe.direction = .left
            /// Sinon l'appareil est orienté portrait
        } else {
            swipeLabel.text = "Swipe up to share"
            iconSwipe.transform = CGAffineTransform(rotationAngle: 0.0)
            swipe.direction = .up
        }
        
        // On nettoie les gestes précédents
        pictureView.gestureRecognizers?.forEach {
            pictureView.removeGestureRecognizer($0)
        }
        
        // Et on ajoute le nouveau geste
        pictureView.addGestureRecognizer(swipe)
    }
}

// MARK: - Accessibilité aux photos de l'appareil
extension ViewController {
    
    /// Une UIImageView a été tapée
    ///
    /// - parameter gesture: Tap gesture
    @objc private func didTapView(_ gesture: UITapGestureRecognizer){
        
        // Check the authorization for the photo library access
        checkAuthorization()
        
        // Vérifiez si la vue tapée est une UIImageView
        guard let view = gesture.view as? UIImageView else { return }
        
        // Affecte une nouvelle valeur à viewTapped
        viewTapped = view
    }
    
    /// Indique que l'utilisateur a sélectionné une image fixe.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Vérifiez si l'image sélectionnée par l'utilisateur est une UIImage
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // Changer l'image et le mode de contenu dans viewTappedhange the image and content mode in viewTapped
            viewTapped!.contentMode = .scaleAspectFill
            viewTapped!.clipsToBounds = true
            viewTapped!.image = selectedImage
        }
        
        // Fermer le sélecteur
        dismiss(animated: true)
    }
    
    /// Indique que l'utilisateur a annulé l'opération de sélection
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Fermer le sélecteur
        dismiss(animated: true)
    }
    
    /// Vérifier l'autorisation d'accès à la photothèque
    private func checkAuthorization() {
        
        PHPhotoLibrary.requestAuthorization { status in
            
            // Vérifier le statut de l'autorisation
            switch status{
                // si c'est autorisé ET la PhotoLibrary est disponible
            case .authorized where UIImagePickerController.isSourceTypeAvailable(.photoLibrary):
                
                // Créer un sélecteur d'image
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                // Présente le sélecteur d'image
                DispatchQueue.main.async {
                    self.present(imagePicker, animated: true)
                }
                
            default:
                
                // Popup d'alerte
                let alert = UIAlertController(title: "", message: "You've refused the access to your photo library, grant the access in your phone settings", preferredStyle: .alert)
                
                // Bouton Paramètres
                let settings = UIAlertAction(title: "Settings", style: .default) { _ in
                    
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                    
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl)
                    }
                }
                
                // Boutton d'annulation
                let cancel = UIAlertAction(title: "Cancel", style: .destructive)
                
                // Ajout des actions
                alert.addAction(cancel)
                alert.addAction(settings)
                
                // Affichage de l'alerte
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
            }
        }
    }
}

