//
//  DoneViewController.swift
//  Connect
//
//  Created by Scott Weinert on 7/21/17.
//  Copyright © 2017 Q2 Software Inc. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    var eventData: String?
    
    @IBOutlet weak var output: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("pass in data \(self.eventData)")
        self.output.text = self.eventData
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

