//
//  Theme.swift
//  InstaGridSoz
//
//  Created by Sofyan Zarouri on 24/01/2022.
//  Copyright © 2022 Sofyan Zarouri. All rights reserved.
//

import UIKit

class Theme: UIView {
    
    // Connect the storyboard items
    @IBOutlet var pictureView: UIView!
    // Ceci represente une collection d'outlets, c'est un tableau qui contient toutes les images
    @IBOutlet var photoViews: [UIImageView]!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // Enum for the theme style
    enum ThemeStyle {
        case classic, custom
        
        // Property for switch between classic and custom style
        var toggleTheme: ThemeStyle {
            switch self {
            case .classic:
                return .custom
            case .custom:
                return .classic
            }
        }
    }
    
    // Computed property for the theme style
    var theme: ThemeStyle = .classic {
        didSet {
            changeTheme(theme)
        }
    }
    
    /// Change the app's theme
    ///
    /// - parameter theme: Can be classic or custom
    private func changeTheme(_ theme: ThemeStyle) {
        
        switch theme {
        case .classic:
            
            // Bgk colors
            self.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
            
            // PictureView settings
            pictureView.backgroundColor = #colorLiteral(red: 0, green: 0.4076067805, blue: 0.6132292151, alpha: 1)
            pictureView.layer.cornerRadius = 0
            pictureView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            pictureView.layer.shadowOpacity = 0.5
            pictureView.layer.shadowOffset = CGSize(width: 0, height: 2)
            pictureView.layer.shadowRadius = 4
            pictureView.layer.shadowPath = UIBezierPath(rect: pictureView.bounds).cgPath
            
            // PhotoViews settings
            photoViews.forEach {
                $0.layer.cornerRadius = 0
                $0.backgroundColor = #colorLiteral(red: 0.9410838485, green: 0.9412414432, blue: 0.9410631061, alpha: 1)
                $0.image = #imageLiteral(resourceName: "iconPlus")
                $0.contentMode = .scaleAspectFit
            }
            
            // Buttons settings
            leftButton.setBackgroundImage(#imageLiteral(resourceName: "buttonLeft"), for: .normal)
            leftButton.setImage(#imageLiteral(resourceName: "buttonSelected"), for: .selected)
            leftButton.layer.shadowOpacity = 0
            centerButton.setBackgroundImage(#imageLiteral(resourceName: "buttonCenter"), for: .normal)
            centerButton.setImage(#imageLiteral(resourceName: "buttonSelected"), for: .selected)
            centerButton.layer.shadowOpacity = 0
            rightButton.setBackgroundImage(#imageLiteral(resourceName: "buttonRight"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "buttonSelected"), for: .selected)
            rightButton.layer.shadowOpacity = 0
            
        case .custom:
            
            // Bgk color
            self.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            
            // PictureView settings
            pictureView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            pictureView.layer.cornerRadius = 10
            pictureView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            pictureView.layer.shadowOpacity = 0.35
            pictureView.layer.shadowOffset = CGSize(width: 0, height: 20)
            pictureView.layer.shadowRadius = 20
            pictureView.layer.shadowPath = UIBezierPath(rect: pictureView.bounds).cgPath
            
            // PhotoViews settings
            photoViews.forEach {
                $0.layer.cornerRadius = 10
                $0.backgroundColor = #colorLiteral(red: 0.9410838485, green: 0.9412414432, blue: 0.9410631061, alpha: 1)
                $0.image = #imageLiteral(resourceName: "customIconPlus")
                $0.contentMode = .scaleAspectFit
            }
            
            // Left button settings
            leftButton.layer.cornerRadius = 5
            leftButton.setBackgroundImage(#imageLiteral(resourceName: "customLeftButton"), for: .normal)
            leftButton.setImage(#imageLiteral(resourceName: "customButtonSelected"), for: .selected)
            leftButton.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            leftButton.layer.shadowOpacity = 0.30
            leftButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            leftButton.layer.shadowRadius = 10
            leftButton.layer.shadowPath = UIBezierPath(rect: leftButton.bounds).cgPath
            
            // Center button settings
            centerButton.layer.cornerRadius = 5
            centerButton.setBackgroundImage(#imageLiteral(resourceName: "customCenterButton"), for: .normal)
            centerButton.setImage(#imageLiteral(resourceName: "customButtonSelected"), for: .selected)
            centerButton.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            centerButton.layer.shadowOpacity = 0.30
            centerButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            centerButton.layer.shadowRadius = 10
            centerButton.layer.shadowPath = UIBezierPath(rect: leftButton.bounds).cgPath
            
            // Right button settings
            rightButton.layer.cornerRadius = 5
            rightButton.setBackgroundImage(#imageLiteral(resourceName: "customRightButton"), for: .normal)
            rightButton.setImage(#imageLiteral(resourceName: "customButtonSelected"), for: .selected)
            rightButton.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            rightButton.layer.shadowOpacity = 0.30
            rightButton.layer.shadowOffset = CGSize(width: 0, height: 5)
            rightButton.layer.shadowRadius = 10
            rightButton.layer.shadowPath = UIBezierPath(rect: leftButton.bounds).cgPath
        }
    }
}
