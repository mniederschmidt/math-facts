//
//  FactViewController.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 12/20/17.
//  Copyright © 2017 Mary Niederschmidt. All rights reserved.
//

import UIKit

class FactViewController: UIViewController {

    @IBOutlet weak var operand1: UILabel!
    @IBOutlet weak var operand2: UILabel!
    @IBOutlet weak var mathSign: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var answerFeedback: UIImageView!
    
    var mathFactsModel: MathFactsModel?
    var mathFact: MathFact?
//    var mathFact: StudentFact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextFact()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        checkFact()
    }
    
    func showNext() {
        // If all facts have been mastered, show celebration screen
        if let allFactsMastered: Bool = mathFactsModel?.allFactsMastered() {
            if allFactsMastered {
                performSegue(withIdentifier: "showCelebration", sender: self)
                return
            } else {
                showNextFact()
            }
        }
    }
    
    func showNextFact() {
        mathFact = mathFactsModel?.nextFact()
        
        if let num1 = mathFact?.operand1,
           let num2 = mathFact?.operand2 {
            operand1.text = String(describing: num1)
            operand2.text = String(describing: num2)
        } else {
            operand1.text = nil
            operand2.text = nil
        }
        
        // TODO: Fix this
//        mathSign.text = mathFact?.operation
        answer.text = nil
        answerFeedback.image = nil
    }
    
    func checkFact() {
        if let currentAnswer: String = answer.text,
            let currentAnswerNum: Int16 = Int16(currentAnswer) {
            // TODO: Fix this
            //       Figure out how to handle computed result in core data - use struct, or add to core data classes?
//            if currentAnswerNum == mathFact?.result() {
            if currentAnswerNum == 2 {
                // display check mark and animate
                answerFeedback.alpha = 0
                answerFeedback.image = #imageLiteral(resourceName: "GreenCheckMark")
                UIView.animate(withDuration: 1.8, delay: 0.5, options: [.curveEaseOut], animations: {
                    self.answerFeedback.alpha = 1
                }, completion: {(finished: Bool) in
                    self.showNext()
                })
            } else {
                // display X and stay
                answerFeedback.image = #imageLiteral(resourceName: "Wrong")
            }
        }
    }
}
