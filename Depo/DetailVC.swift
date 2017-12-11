//
//  DetailVC.swift
//  Depo
//
//  Created by Minjung Kim on 20/11/17.
//  Copyright © 2017 June Kim. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    
    @IBOutlet weak var detailLabel: UILabel!
    
    var detailText : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detailText
        
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
