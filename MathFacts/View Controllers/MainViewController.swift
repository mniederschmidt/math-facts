//
//  MainViewController.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 12/13/17.
//  Copyright © 2017 Mary Niederschmidt. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let session = ApplicationSession()
    var mathFactsModel: MathFactsModel?

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
//    var mainView: MainView {
//        return view as! MainView
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainView.delegate = self
        mathFactsModel = MathFactsModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mathFactsModel?.reset()
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
        mathFactsModel?.add = true
    }

    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
        mathFactsModel?.subtract = true
    }

    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
        mathFactsModel?.multiply = true
    }

    @IBAction func divideButtonPressed(_ sender: UIButton) {
        sender.isSelected = true
        mathFactsModel?.divide = true
    }
    
    @IBAction func quizButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showFacts", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFacts" {
            let controller = segue.destination as! FactViewController
            controller.mathFactsModel = mathFactsModel
        }
    }
}

