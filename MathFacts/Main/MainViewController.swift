import UIKit

class MainViewController: UIViewController {

    let session = ApplicationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if session.isUserLoggedIn {
            presentStudentsController()
        } else {
            presentLoginController()
        }
    }
    
    func presentLoginController() {
        let loginStoryboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        guard let loginVC = loginStoryboard.instantiateInitialViewController() as? LoginViewController else {
            print("Failed Login View Controller INIT")
            return
        }
        loginVC.delegate = self
        
        if let currentVC = childViewControllers.first, currentVC !== loginVC {
            transition(from: currentVC, to: loginVC, duration: 1.0, setup: {
                loginVC.view.alpha = 0.0
            }, animation: {
                loginVC.view.alpha = 1.0
                currentVC.view.alpha = 0.0
            })
        } else {
            addFullScreen(controller: loginVC, animationDuration: 0.5, setup: {
                loginVC.view.alpha = 0.0
            }, animation: {
                loginVC.view.alpha = 1.0
            })
        }
    }
    
    func presentStudentsController() {
        let factsStoryboard = UIStoryboard(name: "StudentFacts", bundle: Bundle.main)
        guard let factsNavigationVC = factsStoryboard.instantiateInitialViewController() as? UINavigationController,
            let studentsVC = factsNavigationVC.childViewControllers.first as? StudentsViewController else {
                print("Failed Facts View Controller INIT")
                return
        }
        studentsVC.session = session
        // TODO:  Do I want to use student persistence and/or student model here instead?
        studentsVC.model = MathFactsModel(factsPersistence: session.mathFactsPersistence)
        
        if let loginVC = childViewControllers.first as? LoginViewController {
            transition(from: loginVC, to: factsNavigationVC, duration: 0.5, setup: {
                factsNavigationVC.view.alpha = 0.0
            }, animation: {
                factsNavigationVC.view.alpha = 1.0
                loginVC.view.alpha = 0.0
            })
        } else {
            addFullScreen(controller: factsNavigationVC, animationDuration: 0.5, setup: {
                factsNavigationVC.view.alpha = 0.0
            }, animation: {
                factsNavigationVC.view.alpha = 1.0
            })
        }
    }
}

extension MainViewController: LoginViewControllerDelegate {
    func loginButtonPressed() {
        session.attemptLogin { success in
            if success {
                self.presentStudentsController()
            }
        }
    }
    
    func usernameUpdated(to username: String?) {
        session.username = username
    }
}
