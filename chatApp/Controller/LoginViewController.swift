

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = loginTextField.text {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
                let message = "You have some mistake in email or password"
                let title = "Warning"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "LoginToChat", sender: self)
            }
        }
    }
        
    }
}
