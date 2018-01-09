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
    
//    var mathFact: MathFact
    var mathFactsModel: MathFactsModel?
    var mathFact: DMMathFact?

    override func viewDidLoad() {
        super.viewDidLoad()
        showNextFact()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
//        if factCorrect() {
//            if allFactsMastered() {
//                performSegue(withIdentifier: "showCelebration", sender: self)
//            } else {
//                showNextFact()
//            }
//        }
        checkFact()
    }
    
    func showNextFact() {
        mathFact = mathFactsModel?.nextFact()
        
        if let num1: Int32 = mathFact?.operand1,
           let num2: Int32 = mathFact?.operand2 {
            operand1.text = String(describing: num1)
            operand2.text = String(describing: num2)
        } else {
            operand1.text = nil
            operand2.text = nil
        }
        
        mathSign.text = mathFact?.sign()
        answer.text = nil
        answerFeedback.image = nil
    }
    
    func checkFact() {
        if let currentAnswer: String = answer.text,
            let currentAnswerNum: Int32 = Int32(currentAnswer) {
            if currentAnswerNum == mathFact?.result() {
                // display check mark and animate
                answerFeedback.alpha = 0
                answerFeedback.image = #imageLiteral(resourceName: "GreenCheckMark")
                UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveEaseOut], animations: {
                    self.answerFeedback.alpha = 1
                }, completion: {(finished: Bool) in
                    if (self.mathFactsModel?.allFactsMastered())! {
                        self.performSegue(withIdentifier: "showCelebration", sender: self)
                    } else {
                        self.showNextFact()
                    }
                })
            } else {
                // display X and stay
                answerFeedback.image = #imageLiteral(resourceName: "Wrong")
            }
            // TODO: Figure out what to do if no answer or answer not numeric
//        } else {
//            return false
        }
    }
    
//    // TODO:  Return true if array size of facts to learn is 0
//    func allFactsMastered() -> Bool {
//        return false
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
