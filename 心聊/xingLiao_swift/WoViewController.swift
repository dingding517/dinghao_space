//
//  WoViewController.swift
//  xingLiao_swift
//
//  Created by 丁昊 on 15/8/4.
//  Copyright (c) 2015年 dinghao. All rights reserved.
//

import UIKit

class WoViewController: UITableViewController {
    var listData:NSArray!
    var dicData:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let plistPath1 = NSBundle.mainBundle().pathForResource("wo_", ofType: "plist")
        self.dicData = NSDictionary(contentsOfFile: plistPath1!)
        self.listData = dicData.allKeys as NSArray
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.dicData.count
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return (self.dicData["section\(section)"] as! NSArray).count
    }

    ///*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var CellId:String!
        if indexPath.section == 0 {
            CellId = "CellWo101"
        }else if indexPath.section == 1 && indexPath.row == 0{
            CellId = "CellWo102"
        }else if indexPath.section == 1 && indexPath.row == 1 {
            CellId = "CellWo103"
        }else if indexPath.section == 1 && indexPath.row == 2 {
            CellId = "CellWo104"
        }else if indexPath.section == 2 {
            CellId = "CellWo105"
        }else if indexPath.section == 3 {
            CellId = "CellWo106"
        }else {
            
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(CellId, forIndexPath: indexPath) 

        // Configure the cell...
        let section = indexPath.section
        let row = indexPath.row
        cell.textLabel?.text = ((self.dicData["section\(section)"] as! NSArray)[row] as! NSDictionary)["cellName"] as? String
        return cell
    }
    //*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    ///*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    //*/
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 88.0
        }else {
            return 44.0
        }
    }

}



