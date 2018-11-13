//
//  HighScoreVC.swift
//  snakeProject
//
//  Created by James Ahrens on 11/12/18.
//  Copyright © 2018 James Ahrens. All rights reserved.
//

import UIKit

class HighScoreVC: UITableViewController {
    
    var currentScores = [(String, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let s = ScoreSingleton.sharedInstance
        print(s.scores)
        for score in s.scores {
            currentScores.append((score.key, score.value))
        }
        //currentScores = s.scores

        
        /*let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let dirUrl = URL(fileURLWithPath: dirPath)
        let fileUrl = dirUrl.appendingPathComponent("high_scores.txt")
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
            
            scores = json["scores"] as! [String: Int]

            
            //self.data = try Data(contentsOf: location)
            //let obj = try JSONSerialization.jsonObject(with: self.data, options: .mutableContainers) as! [String : AnyObject]
            
            /*let packs = obj["data"] as! [[String: AnyObject]]
            let fields = ["code", "title", "faction_code", "pack_code"]
            for pack in packs {
                let temp = NetCard()
                for(key, value) in pack {
                    if fields.contains(key) {
                        if value is NSString {
                            temp.setValue(value, forKey: key)
                        }
                    }
                }
                if temp.pack_code == packCode {
                    cardArray.append(temp)
                }
                allCardsArray.append(temp)
                //tableView.reloadData()
                //print(temp.name)
                
                
            }*/
        } catch {
            print("file load error...")
        }*/
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentScores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highscore", for: indexPath) as! HighScoreCell

        cell.nameLabel.text = currentScores[indexPath.item].0
        cell.scoreLabel.text = String(currentScores[indexPath.item].1)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ScoreSingleton : NSObject {
    
    var scores : [String : Int]
    let fileUrl : URL
    static let sharedInstance = ScoreSingleton()
    
    private override init() {
        scores = [String : Int]()
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let dirUrl = URL(fileURLWithPath: dirPath)
        fileUrl = dirUrl.appendingPathComponent("high_scores.txt")
        
        //scores["Dev"] = 999
        //scores.append(["Dev" : 999])
        
        /*do {
            // Convert words into JSON data
            let data = try JSONSerialization.data(withJSONObject: scores, options: .prettyPrinted)
            print(data)
            // Write JSON data to file
            try data.write(to: fileUrl)
        } catch {
            print("error in deinit")
        }*/
        
        super.init()
        print("attempting to read file now")
        
        do {
            let data = try Data(contentsOf: fileUrl)
            print(data)
            scores = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Int]
            print(scores)
        } catch {
            print("file load error...")
        }
    }
    
    func addScore(name : String, score : Int) {
        scores[name] = score
        do {
            // Convert words into JSON data
            let data = try JSONSerialization.data(withJSONObject: scores, options: .prettyPrinted)
            // Write JSON data to file
            try data.write(to: fileUrl)
        } catch {
            print("error in deinit")
        }
    }
    
    deinit {
        do {
            // Convert words into JSON data
            let data = try JSONSerialization.data(withJSONObject: scores, options: .prettyPrinted)
            // Write JSON data to file
            try data.write(to: fileUrl)
        } catch {
            print("error in deinit")
        }
    }
    
}
