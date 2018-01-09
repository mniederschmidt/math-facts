//
//  CelebrateViewController.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 12/20/17.
//  Copyright © 2017 Mary Niederschmidt. All rights reserved.
//

import UIKit

class CelebrateViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIViewX!

    var firstAppearance: Bool = true
    var currentColorArrayIndex: Int = -1
    var colorArray: [(color1: UIColor, color2: UIColor)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadColorArray()
        animateBackgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.firstAppearance {
            self.firstAppearance = false
        }
    }

    func loadColorArray() {
        let gradientColor1 = #colorLiteral(red: 0.6117647059, green: 0.1529411765, blue: 0.6901960784, alpha: 1)
        let gradientColor2 = #colorLiteral(red: 1, green: 0.2509803922, blue: 0.5058823529, alpha: 1)
        let gradientColor3 = #colorLiteral(red: 0.4823529412, green: 0.1215686275, blue: 0.6352941176, alpha: 1)
        let gradientColor4 = #colorLiteral(red: 0.1254901961, green: 0.2980392157, blue: 1, alpha: 1)
        let gradientColor5 = #colorLiteral(red: 0.1254901961, green: 0.6196078431, blue: 1, alpha: 1)
        let gradientColor6 = #colorLiteral(red: 0.3529411765, green: 0.4705882353, blue: 0.4980392157, alpha: 1)
        let gradientColor7 = #colorLiteral(red: 0.2274509804, green: 1, blue: 0.8509803922, alpha: 1)
        colorArray.append((color1: gradientColor1, color2: gradientColor2))
        colorArray.append((color1: gradientColor2, color2: gradientColor3))
        colorArray.append((color1: gradientColor3, color2: gradientColor4))
        colorArray.append((color1: gradientColor4, color2: gradientColor5))
        colorArray.append((color1: gradientColor5, color2: gradientColor6))
        colorArray.append((color1: gradientColor6, color2: gradientColor7))
        colorArray.append((color1: gradientColor7, color2: gradientColor1))
    }
    
    func animateBackgroundColor() {
        currentColorArrayIndex = currentColorArrayIndex == (colorArray.count - 1) ? 0 : currentColorArrayIndex + 1
        
        UIView.transition(with: gradientView, duration: 2, options: [.transitionCrossDissolve], animations: {
            self.gradientView.firstColor = self.colorArray[self.currentColorArrayIndex].color1
            self.gradientView.secondColor = self.colorArray[self.currentColorArrayIndex].color2
            self.gradientView.horizontalGradient = true
        }) { (success) in
            // completion block:  after successfully complete, make recursive call to self
            self.animateBackgroundColor()
        }
    }

}
