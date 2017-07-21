//
//  ConnectViewController.swift
//  Connect
//
//  Created by Scott Weinert on 7/21/17.
//  Copyright © 2017 Q2 Software Inc. All rights reserved.
//

import UIKit
import WebKit

class ConnectViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    @IBOutlet weak var containerView: UIView!
    var wkWebView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wkWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: containerView.frame.height))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        view.addSubview(self.wkWebView!)
        self.wkWebView?.navigationDelegate = self

        let urlString = "https://connect.unbill.us/?clientId=593ab9ef8ea75a6602fe90e2&apiKey=1f4c3860-23ae-11e7-bf2a-fbdce2d27727"
//        let urlString = "http://localhost:8080/?clientId=593ab9ef8ea75a6602fe90e2&apiKey=1f4c3860-23ae-11e7-bf2a-fbdce2d27727"
        let url = URL(string: urlString)!
        self.wkWebView?.load(URLRequest(url: url) as URLRequest)

        self.wkWebView?.configuration.userContentController.add(
            self,
            name: "authenticated"
        )
        
        self.wkWebView?.configuration.userContentController.add(
            self,
            name: "close"
        )

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
    {
        print("got '\(message.name)' event: \(message.body)")
        if(message.name == "authenticated") {
            print("Authentication complete")
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Done") as! DoneViewController
        nextViewController.eventData = "output was \(message.body)"
        self.present(nextViewController, animated:true, completion:nil)

    }
    
}



