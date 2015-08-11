//
//  RegisterViewController.swift
//  xingLiao_swift
//
//  Created by 丁昊 on 15/8/4.
//  Copyright (c) 2015年 dinghao. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet var secretNum: UITextField!
    @IBAction func save(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { ()->Void in
             NSLog("点击Save按钮，关闭模态视图")
            let dataDict = NSMutableDictionary(object: self.txtUsername.text, forKey:"username")
            dataDict.setObject(self.secretNum.text, forKey:"secretNumber")
            NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: dataDict as [NSObject : AnyObject])
        })
    }
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {NSLog("点击Cancel按钮，关闭模态视图")})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataDict = NSMutableDictionary(object: "1", forKey:"username")
        dataDict.setObject("1", forKey:"secretNumber")
    NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: dataDict as [NSObject : AnyObject])
        // Do any additional setup after loading the view.
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    ///*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    //*/

}
