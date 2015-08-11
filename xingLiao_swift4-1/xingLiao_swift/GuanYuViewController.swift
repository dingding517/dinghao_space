//
//  GuanYuViewController.swift
//  xingLiao_swift
//
//  Created by 丁昊 on 15/8/5.
//  Copyright (c) 2015年 dinghao. All rights reserved.
//

import UIKit

class GuanYuViewController: UITableViewController {
    @IBOutlet weak var zxImageView: UIImageView!
    var dicData3:NSDictionary!
    //var zxImageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let plistPath3 = NSBundle.mainBundle().pathForResource("GuanYu", ofType: "plist")
        self.dicData3 = NSDictionary(contentsOfFile: plistPath3!)
        
        
        //self.zxImageView.translatesAutoresizingMaskIntoConstraints()
        self.zxImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        
//        var centConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.zxImageView as AnyObject,
//            attribute: NSLayoutAttribute.Top,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: self.view as AnyObject,
//            attribute: NSLayoutAttribute.CenterX,
//            multiplier: 1.0,
//            constant: 0.0)
//        var heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.zxImageView as AnyObject,
//            attribute: NSLayoutAttribute.Top,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: self.view as AnyObject,
//            attribute: NSLayoutAttribute.Top,
//            multiplier: 0.1,
//            constant: 0.0)
//        centConstraint.active = true
//        heightConstraint.active = true
        
        //self.zxImageView.frame = CGRectMake(135.0, 30.0, 100.0, 200.0)
        self.zxImageView.image = UIImage(named: "39ac00dcc1f447ed5913ee4d05ab2b30")

        self.view.addSubview(self.zxImageView)

        
        //self.zxImageView.a NSLayoutAttribute
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return (self.dicData3["section\(section)"] as! NSArray).count
    }

    ///*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var CellId:String!
        if indexPath.row == 0 {
            CellId = "CellGuanYu101"
        }else if indexPath.row == 1 {
            CellId = "CellGuanYu102"
        }else if indexPath.row == 2 {
            CellId = "CellGuanYu103"
        }else if indexPath.row == 3 {
            CellId = "CellGuanYu104"
        }else if indexPath.row == 4 {
            CellId = "CellGuanYu105"
        }else {
            
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(CellId, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = ((self.dicData3["section\(indexPath.section)"] as! NSArray)[indexPath.row] as! NSDictionary)["name"] as? String
        if indexPath.row == 0 {
            cell.frame.size.height = 160.0
        }else if indexPath.row == 6 {
            cell.frame.size.height = 80.0
        }else {
            
        }
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
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    
}
