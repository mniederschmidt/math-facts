//
//  MainView.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/7/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//

import UIKit

protocol MainViewDelegate: class {
    func quizButtonPressed()
}

class MainView: UIView {
    
    // MARK: Properties
    var add: Bool = false
    var subtract: Bool = false
    var multiply: Bool = false
    var divide: Bool = false

    weak var delegate: MainViewDelegate?
    

}
