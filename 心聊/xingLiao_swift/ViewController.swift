//
//  ViewController.swift
//  xingLiao_swift
//
//  Created by 丁昊 on 15/8/4.
//  Copyright (c) 2015年 dinghao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate{
    @IBOutlet weak var userIdTextfield: UITextField!

    @IBOutlet weak var userSecretTextfield: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    var theData:NSDictionary! = nil
    var username:NSString! = nil
    var secretNumber:NSString! = nil
    
    @IBAction func zxTextFieldAction(sender: AnyObject) {
        self.userSecretTextfield.resignFirstResponder()
    }
    @IBAction func LoginBtnAction(sender: AnyObject) {
        if self.userIdTextfield.text != self.username || self.userSecretTextfield.text != self.secretNumber || self.userIdTextfield.text == "" || self.userSecretTextfield.text == "" {
//        if self.userIdTextfield.text != "1" || self.userSecretTextfield.text != "1" {
            let alertController = UIAlertController(title: "", message:"用户名或密码错误，请重新输入", preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "出错啦", style: UIAlertActionStyle.Cancel, handler: {Void in print(" LoginBtn button is pressed", terminator: "")})
            
//            let handleClosure:(UIAlertAction!)->Void = {
//                (action:UIAlertAction!)->Void in print("\(action.title)custom button is pressed", terminator: "")
//            }
            alertController.addAction(alertAction)
            self.presentViewController(alertController,animated:true,completion:nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerCompletion:", name: "RegisterCompletionNotification", object: nil)
    }
    
    func registerCompletion(notification: NSNotification) {
        self.theData = notification.userInfo!
        self.username = theData.objectForKey("username") as! NSString
        self.secretNumber = theData.objectForKey("secretNumber") as! NSString
        NSLog("username = %@",username)
        NSLog("secretNumber = %@",secretNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

