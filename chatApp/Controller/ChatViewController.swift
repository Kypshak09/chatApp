

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🗣 Chatssenger"
        navigationItem.hidesBackButton = true
    }
   
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
    do {
        try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
        
    }
    
}
