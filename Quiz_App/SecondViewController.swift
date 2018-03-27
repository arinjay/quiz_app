//
//  SecondViewController.swift
//  Quiz_App
//
//  Created by Arinjay on 27/03/18.
//  Copyright © 2018 Arinjay. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var data = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = String(data) + "/10"
    }

    
    
    @IBAction func dismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
