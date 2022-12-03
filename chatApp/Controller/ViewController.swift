//
//  ViewController.swift
//  chatApp
//
//  Created by Amir Zhunussov on 03.12.2022.
//

import UIKit
import CLTypingLabel
class ViewController: UIViewController {

    @IBOutlet weak var labelText: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelText.text = "🗣 Chatssenger"
        
    }
    

}
