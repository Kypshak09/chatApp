

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = Constant.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: Constant.cellNibName, bundle: nil), forCellReuseIdentifier: Constant.cellIdentifier)
        
        loadMessage()
    }
    
    func loadMessage() {
        
        
        db.collection(Constant.FStore.collectionName).order(by: Constant.FStore.dateField).addSnapshotListener{ querySnapshot, error in
            
            self.message = []
            
            if let e = error {
                print("There is some retreiving error. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data[Constant.FStore.senderField] as? String, let messageBody = data[Constant.FStore.bodyField] as? String {
                            let newMessage = Message(name: sender, body: messageBody)
                            self.message.append(newMessage)
                            
                            DispatchQueue.main.async { [self] in
                                self.tableView.reloadData()
                                let IndexPath = IndexPath(row: self.message.count - 1, section: 0 )
                                self.tableView.scrollToRow(at: IndexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
   
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(Constant.FStore.collectionName).addDocument(data: [Constant.FStore.senderField: messageSender, Constant.FStore.bodyField: messageBody, Constant.FStore.dateField:Date().timeIntervalSince1970]) { error in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                }
            }
            self.messageTextField.text = ""
        }
        
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
    
        do {
                    try Auth.auth().signOut()
                    navigationController?.popViewController(animated: true)
                    
                    
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
      
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message1 = message[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message[indexPath.row].body
        
        if message1.name == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = .orange
            cell.label.textColor = .black
        } else {
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.messageBubble.backgroundColor = .purple
            cell.label.textColor = .black
        }
        
        
        return cell
    }
}
