//
//  SpringAnimationViewController.swift
//  SpringAnimationHW
//
//  Created by Иван Дрожжин on 06.08.2022.
//

import UIKit
import SpringAnimation

class SpringAnimationViewController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var parametersTextView: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    
    let animations = AnimationPreset.allCases
    let animationCurves = AnimationCurve.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 5
        
        let nextAnimation = getNextAnimation()
        setupParametersText(with: nextAnimation)
        setupButton(with: "Run")
    }
    
    @IBAction func startTheAnimation(_ sender: Any) {
    }
    
    //MARK: Private methods
    private func getNextAnimation() -> NextAnimation {
        NextAnimation(
            preset: animations.randomElement() ?? .pop,
            curve: animationCurves.randomElement() ?? .easeIn,
            force: Float.random(in: 0...2),
            duration: Float.random(in: 0...1.2),
            delay: Float.random(in: 0...1.2)
        )
    }
    
    private func setupButton(with title: String) {
        actionButton.configuration?.title = title
    }
    
    private func setupParametersText(with nextAnimation: NextAnimation) {
        parametersTextView.text = """
Preset: \(nextAnimation.preset.rawValue)
Curve: \(nextAnimation.curve.rawValue)
\(String(format: "Force: %.2f", nextAnimation.force))
\(String(format: "Duration: %.2f", nextAnimation.duration))
\(String(format: "Delay: %.2f", nextAnimation.delay))
"""
    }
    
}

