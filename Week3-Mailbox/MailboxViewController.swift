//
//  MailboxViewController.swift
//  Week3-Mailbox
//
//  Created by Christopher Sybico on 9/30/15.
//  Copyright © 2015 Christopher Sybico. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var emailListScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailListScrollView.contentSize = CGSize(width: 320, height: 1279)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
