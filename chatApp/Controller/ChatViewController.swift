

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    var message: [Message] = [
    Message(name: "a@b", body: "rama"),
    Message(name: "b@a", body: "amir")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        title = Constant.appName
        navigationItem.hidesBackButton = true
    }
   
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
    
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
    }       catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
    }
      
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        cell.textLabel?.text = message[indexPath.row].body
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
