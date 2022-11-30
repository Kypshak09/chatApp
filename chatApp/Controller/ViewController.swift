//
//  ViewController.swift
//  chatApp
//
//  Created by Amir Zhunussov on 28.11.2022.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = ""
        var charIndex = 0.0
        let titleText = "🗣 Chatssenger"
        for i in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.textLabel.text?.append(i)
            }
            charIndex += 1
        }
        
    }


}

