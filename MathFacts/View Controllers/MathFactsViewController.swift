import UIKit

class MathFactsViewController: UIViewController {

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
        mathFactsModel = MathFactsModel(factsPersistence: session.mathFactsPersistence)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mathFactsModel?.reset()
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        if addButton.isSelected == true {
            addButton.isSelected = false
            mathFactsModel?.add = false
//            let darkBlur = UIBlurEffect(style: <#T##UIBlurEffectStyle#>)
//            addButton.currentImage?.cgImage?.alphaInfo
//            addButton.isHighlighted = false
        } else {
            addButton.isSelected = true
            mathFactsModel?.add = true
//            addButton.isHighlighted = true
        }
//        sender.isSelected = true
//        mathFactsModel?.add = true
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

