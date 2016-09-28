//
//  TableViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/28/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // MARK: - Variable
    var list : [String] = []
    let offset = ["badapple","badbanana","badcherri"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.append(contentsOf: ["apple","banana","cherry"] )
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshControl?.attributedTitle = NSAttributedString(string: "reloading~~")
//        self.isEditing = true
    }
    
    // MARK: - Function
    func refreshHandler() {
        self.refreshControl?.endRefreshing()
        
        reloadInputViews()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! CustomTableViewCell

        // Configure the cell...
//        cell.textLabel?.text = list[indexPath.row]
//        cell.detailTextLabel?.text = "@W@"
        
        // Configure the Custom TableView Cell
        cell.theLabel.text = list[indexPath.row]
        cell.theSlider.value = 0.5
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print(">>> I select \(list[indexPath.row])")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic )
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        //
//        return .none
//    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Bye~"
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        swap(&list[fromIndexPath.row], &list[to.row])
        let f = fromIndexPath.row , t = to.row
        (list[f], list[t]) = (list[t], list[f])
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    

}
