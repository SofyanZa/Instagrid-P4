//
//  ViewController.swift
//  InstaGrid-P4
//
//  Created by SofyanZ on 04/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
    

}

