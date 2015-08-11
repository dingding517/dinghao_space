//
//  TongXunLuViewController.swift
//  xingLiao_swift
//
//  Created by 丁昊 on 15/8/4.
//  Copyright (c) 2015年 dinghao. All rights reserved.
//

import UIKit

class TongXunLuViewController: UITableViewController {
    
    var dictData:NSDictionary!
    var listGroupname:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let plistPath = NSBundle.mainBundle().pathForResource("team_dictionary", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        var tempList = self.dictData.allKeys as NSArray
        self.listGroupname = tempList.sortedArrayUsingSelector("compare:")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.dictData.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var groupName = self.listGroupname[section] as! String
        var listTeams = self.dictData[groupName] as! NSArray
        return listTeams.count
    }

    ///*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var CellId:String!
        CellId = "CellTongXun101"
        let cell = tableView.dequeueReusableCellWithIdentifier(CellId, forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        
        let section = indexPath.section
        let row = indexPath.row
        var groupName = self.listGroupname[section] as! String
        var listTeams = self.dictData[groupName] as! NSArray
        cell.textLabel?.text = listTeams[row] as? String
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var groupName = self.listGroupname[section] as! String
        return groupName
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        var listTitles = NSMutableArray(capacity: self.listGroupname.count)
        
        for item in self.listGroupname {
            var title = item.substringToIndex(1) as String
            listTitles.addObject(title)
        }
        return listTitles as [AnyObject]
    }
    
}
