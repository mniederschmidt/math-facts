//
//  StartViewController.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 12/13/17.
//  Copyright © 2017 Mary Niederschmidt. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: MainView {
        return view as! MainView
    }
    
    var mathFactsModel: MathFactsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
        mathFactsModel = MathFactsModel()
    }


}

