

import UIKit
import CLTypingLabel
class ViewController: UIViewController {

    @IBOutlet weak var labelText: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelText.text = "🗣 Chatssenger"
        navigationController?.isNavigationBarHidden = false
    }
    

}
