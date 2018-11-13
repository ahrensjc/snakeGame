//
//  GameVC.swift
//  snakeProject
//
//  Created by James Ahrens on 11/13/18.
//  Copyright © 2018 James Ahrens. All rights reserved.
//

import SpriteKit
import UIKit

class GameVC: UIViewController {
    
    let s = ScoreSingleton.sharedInstance
    
    @IBAction func addScore(_ sender: Any) {
        s.addScore(name: "Johnny", score: 666)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
