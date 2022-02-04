//
//  PictureView.swift
//  InstaGrid-P4
//
//  Created by SofyanZ on 04/02/2022.
//

/// PictureView est implémenté dans le code pour permettre le changement de layout et de convertir une imageview en image
///
import UIKit

@IBDesignable
class PictureView: UIView {
    
    // Connexion des outlets au storyboard
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    // Nombre pour le style de mise en page
    // On enumere le nombre de dispositions disponibles, dans notre app il y en a 3
    enum LayoutStyle {
        case layout1, layout2, layout3
    }
    
    // Propriété calculée pour la mise en page pictureView
    // De base on a la 3eme disposition
    var style: LayoutStyle = .layout3 {
        didSet {
            changeStyle(style) /// on applique au style la fonction qui permet le changement d'un style de layout à un autre
        }
    }
    // Fonction permettant de Changer la mise en page de l'image
    private func changeStyle(_ style: LayoutStyle) {
        
        switch style { /// On fait un switch sur le layout pour définir pour chaque cas quel position ils auront à adopter
            /// J'agit seulement sur deux propriétés du Layout, c'est suffisant pour réussir l'objectif souhaité
        case .layout1:
            topRightImageView.isHidden = true
            bottomRightImageView.isHidden = false
        case .layout2:
            topRightImageView.isHidden = false
            bottomRightImageView.isHidden = true
        case .layout3:
            topRightImageView.isHidden = false
            bottomRightImageView.isHidden = false
        }
    }
}

// Conversion de l'imageView en image grâce à l'extension de PictureView
extension PictureView {
    
    /// Conversion de UIView en UIImage
    ///
    /// - returns: UIImage
    func asImage() -> UIImage {
        
        // Crée un moteur de rendu avec les limites de la pictureView
        // On utilise bounds lorsqu'on s'interesse au placement des sous vues
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        
        // Renvoie UIImage
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
}

// Ajout des paramètres d'ombre au constructeur d'interface
extension PictureView {
    // Le mot @IBInspectable vous permet de spécifier que certaines parties d'une UIView sous-classe personnalisée doivent être configurables dans Interface Builder. Seuls certains types de valeurs sont pris en charge (booléens, nombres, chaînes, points, rectangles, couleurs et images),
    
    // CGfloat type qui définit un nombre décimal pour placer une vue
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    // CGSize type qui définit une zone de l'ecran
    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
