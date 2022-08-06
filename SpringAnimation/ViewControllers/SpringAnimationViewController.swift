//
//  SpringAnimationViewController.swift
//  SpringAnimation
//
//  Created by Иван Дрожжин on 06.08.2022.
//

import UIKit

class SpringAnimationViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var parametersTextView: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 5
        
    }

    @IBAction func startTheAnimation(_ sender: Any) {
    }
    
}

