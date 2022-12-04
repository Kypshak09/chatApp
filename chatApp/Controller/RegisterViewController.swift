//
//  RegisterViewController.swift
//  chatApp
//
//  Created by Amir Zhunussov on 30.11.2022.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
                let message = "You need to have minimum 6 digit password"
                let title = "Warning"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "RegisterToChat", sender:self)
            }
            }
        }
    }
}
