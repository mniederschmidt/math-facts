//
//  FactViewController.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 12/20/17.
//  Copyright © 2017 Mary Niederschmidt. All rights reserved.
//

import UIKit

class FactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showCelebration", sender: self)
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
