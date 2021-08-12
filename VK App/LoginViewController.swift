//  Created by ikizey on 12.08.2021.



import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton! // for later

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func isValidLogin() -> Bool {
        !loginTextField.text!.isEmpty
    }

    private func isValidPassword() -> Bool {
        passwordTextField.text!.count > 3
    }

    @IBAction func login() {
        guard isValidLogin(), isValidPassword() else {
            let alert = UIAlertController(title: "Error",
                                          message: "login or password is too short",
                                          preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return
        }

        //
    }
}

