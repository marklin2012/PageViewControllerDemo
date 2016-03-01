//
//  FourthViewController.swift
//  PageChange
//
//  Created by O2.LinYi on 16/3/1.
//  Copyright © 2016年 jd.com. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func test(sender: AnyObject) {
        
        let pvc = parentViewController?.parentViewController as! ViewController
        
        
//        var number = (pvc.viewCtls?.indexOf(self))! + 1
//        if number >= pvc.viewCtls?.count {
//            number = 0
//        } else if number < 0 {
//            number = (pvc.viewCtls?.count)! - 1
//        }
//        
//        pvc.pageViewCtl?.setViewControllers([pvc.viewCtls![number]], direction: .Forward, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
