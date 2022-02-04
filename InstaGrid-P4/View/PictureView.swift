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
    
}
