//
//  ViewController.swift
//  Depo
//
//  Created by Minjung Kim on 14/11/17.
//  Copyright © 2017 June Kim. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class LoginVC : UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

