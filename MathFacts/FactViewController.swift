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
    var mathFact: MathFact?

    override func viewDidLoad() {
        super.viewDidLoad()
        showNextFact()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showCelebration", sender: self)
    }
    
    func showNextFact() {
        mathFact = mathFactsModel?.nextFact()
        
        if let num1: Int = mathFact?.operand1,
           let num2: Int = mathFact?.operand2 {
            operand1.text = String(describing: num1)
            operand2.text = String(describing: num2)
        } else {
            operand1.text = nil
            operand2.text = nil
        }
        
        mathSign.text = mathFact?.sign()
        answer.text = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
