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
    @IBOutlet weak var emailListView: UIView!
    @IBOutlet weak var emailKayenImageView: UIImageView!
    @IBOutlet weak var otherEmailImageView: UIImageView!
    
    @IBOutlet weak var laterListIconWrapperView: UIView!
    @IBOutlet weak var listIconImageView: UIImageView!
    @IBOutlet weak var laterIconImageView: UIImageView!
    
    @IBOutlet weak var archiveDeleteIconWrapperView: UIView!
    @IBOutlet weak var archiveIconImageView: UIImageView!
    @IBOutlet weak var deleteIconImageView: UIImageView!
    
    @IBOutlet weak var emailListBgView: UIView!
    
    var initialCenter: CGPoint!
    
    var rescheduleOverlayView: UIView!
    var listOptionsImageView: UIImageView!
    
    
    // Set up reschedule icons
    var laterTodayImageView: UIImageView!
    var thisEveningImageView: UIImageView!
    var tomorrowImageView: UIImageView!
    var thisWeekendImageView: UIImageView!
    var nextWeekImageView: UIImageView!
    var inAMonthImageView: UIImageView!
    var somedayImageView: UIImageView!
    var desktopImageView: UIImageView!
    var pickDateImageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set up email scroll
        emailListScrollView.contentSize = CGSize(width: 320, height: 1279)
        
        // Set up Later icon
        laterIconImageView.alpha = 0
        
        // Set up List icon
        listIconImageView.alpha = 0
        
        // Set up Archive Icon
        archiveIconImageView.alpha = 0

        // Set up Delete icon
        deleteIconImageView.alpha = 0
        
        // Set up reschedule icons
        laterTodayImageView = UIImageView(frame: CGRect(x: 47 / 2, y: 231 / 2, width: 75, height: 75))
        laterTodayImageView.image = UIImage(named: "icLaterToday")
        
        thisEveningImageView = UIImageView(frame: CGRect(x: 245 / 2, y: 231 / 2, width: 75, height: 75))
        thisEveningImageView.image = UIImage(named: "icThisEvening")
        
        tomorrowImageView = UIImageView(frame: CGRect(x: 442 / 2, y: 231 / 2, width: 75, height: 75))
        tomorrowImageView.image = UIImage(named: "icTomorrow")
        
        thisWeekendImageView = UIImageView(frame: CGRect(x: 47 / 2, y: 471 / 2, width: 75, height: 75))
        thisWeekendImageView.image = UIImage(named: "icThisWekend")
        
        nextWeekImageView  = UIImageView(frame: CGRect(x: 245 / 2, y: 471 / 2, width: 75, height: 75))
        nextWeekImageView.image = UIImage(named: "icNextWeek")
        
        inAMonthImageView  = UIImageView(frame: CGRect(x: 442 / 2, y: 471 / 2, width: 75, height: 75))
        inAMonthImageView.image = UIImage(named: "icInAMonth")
        
        somedayImageView = UIImageView(frame: CGRect(x: 47 / 2, y: 711 / 2, width: 75, height: 75))
        somedayImageView.image = UIImage(named: "icSomeday")
        
        desktopImageView = UIImageView(frame: CGRect(x: 245 / 2, y: 711 / 2, width: 75, height: 75))
        desktopImageView.image = UIImage(named: "icDesktop")
        
        pickDateImageView = UIImageView(frame: CGRect(x: 442 / 2, y: 711 / 2, width: 75, height: 75))
        pickDateImageView.image = UIImage(named: "icPickDate")
        
        
        
    }
    
    // Show Reschedule Options
    func showRescheduleOverlay() {
        
        let rescheduleOverlayFrame = self.view.bounds
        rescheduleOverlayView = UIView(frame: rescheduleOverlayFrame)
        view.addSubview(rescheduleOverlayView)
        rescheduleOverlayView.alpha = 0
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let rescheduleBlurView = UIVisualEffectView(effect: blurEffect)
        rescheduleBlurView.frame = rescheduleOverlayFrame
        rescheduleOverlayView.addSubview(rescheduleBlurView)
        
        // Create a new pan gesture recognizer that calls the function "didTapOverlay"
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "didTapOverlay")
        
        // Add the tap gesture regognizer
        rescheduleOverlayView.addGestureRecognizer(tapRecognizer)
        
        // Animate & show blur
        UIView.animateWithDuration(1) { () -> Void in
            self.rescheduleOverlayView.alpha = 1
        }
        
        let rescheduleIconsArray = [laterTodayImageView, thisEveningImageView, tomorrowImageView, thisWeekendImageView, nextWeekImageView, inAMonthImageView, somedayImageView, desktopImageView, pickDateImageView]
        
        for images in rescheduleIconsArray {
            
            rescheduleOverlayView.addSubview(images)
            images.transform = CGAffineTransformScale(images.transform, 1, 1)
            images.alpha = 1
        }
//        animateIcons()
    }
    
    // Show List Options
    func showListOptions() {
        
        listOptionsImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 567))
        listOptionsImageView.image = UIImage(named: "list")
        view.addSubview(listOptionsImageView)
        listOptionsImageView.userInteractionEnabled = true
        
        
        let listTapRecognizer = UITapGestureRecognizer(target: self, action: "didTapList")
        
        listOptionsImageView.addGestureRecognizer(listTapRecognizer)

    }
    
    
    
    func didTapList() {
        print("Tapped List")
        listOptionsImageView.removeFromSuperview()
        hideEmail()
    }
    
    
    func didTapOverlay(){
        print("tapped")
        rescheduleOverlayView.removeFromSuperview()
        
        hideEmail()

    }
    
    func hideEmail() {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
            self.emailListView.alpha = 0
            self.emailListBgView.alpha = 0
            
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(0.2, delay: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.otherEmailImageView.frame.origin.y -= 86
                    }, completion: nil)
        }
        
        delay(3) { () -> () in
            self.resetEmailList()
            
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    func resetEmailList () {
        emailListView.alpha = 1
        emailListBgView.alpha = 1
        otherEmailImageView.frame.origin.y += 86
        emailListView.frame.origin.x = 0
        emailKayenImageView.frame.origin.x = 0
        emailListBgView.backgroundColor = UIColorFromRGB(0xE2E2E2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tim's Convert Value Function
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    
    // stackoverflow.com/questions/24074257/how-to-use-uicolorfromrgb-value-in-swift
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    @IBAction func didPin(sender: UIPanGestureRecognizer) {
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        
        // Begin panning
        if sender.state == UIGestureRecognizerState.Began {
            
            NSLog("You're started at \(location)")
            
            initialCenter = emailKayenImageView.center
            
        }
            
        // Changing
        else if sender.state == UIGestureRecognizerState.Changed {
            
            // Set up correct panning position
            emailKayenImageView.center.x = translation.x + initialCenter.x
            
            // Listen to email's x position, apply converted value to Later icon's alpha
            let laterIconAlpha = convertValue(emailKayenImageView.frame.origin.x, r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
            
            laterIconImageView.alpha = laterIconAlpha
            
            // Listen to email's x position, apply converted value to Archive icon's alpha
            let archiveIconAlpha = convertValue(emailKayenImageView.frame.origin.x, r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
            
            archiveIconImageView.alpha = archiveIconAlpha
            
            
            
            // If x is less than 60, show Later icon
            if (emailKayenImageView.frame.origin.x < -60 && emailKayenImageView.frame.origin.x > -160) {
                
                // Turns background to yellow
                emailListBgView.backgroundColor = UIColorFromRGB(0xFAD333)
                
                // Icons should move with email image
                laterListIconWrapperView.frame.origin.x = emailKayenImageView.frame.origin.x + 320 + 18
                
                // Hide List icon, show Later icon
                listIconImageView.alpha = 0
                laterIconImageView.alpha = 1
                
            }
                
            
            // If x is less than 160, show Later icon
            else if (emailKayenImageView.frame.origin.x < -160){
                
                // Turns background to brown
                emailListBgView.backgroundColor = UIColorFromRGB(0xD8A675)
                
                // Icons should move with email image
                laterListIconWrapperView.frame.origin.x = emailKayenImageView.frame.origin.x + 320 + 18
                
                // Show List icon, hide Later icon
                listIconImageView.alpha = 1
                laterIconImageView.alpha = 0
                
            }
            
            else if (emailKayenImageView.frame.origin.x > 60 && emailKayenImageView.frame.origin.x < 160) {
                
                // Turns background to green
                emailListBgView.backgroundColor = UIColorFromRGB(0x70D862)
                
                // Icons should move with email image
                archiveDeleteIconWrapperView.frame.origin.x = emailKayenImageView.frame.origin.x - 18 - 25
                
                // Hide Delete icon, show Arhive icon
                deleteIconImageView.alpha = 0
                archiveIconImageView.alpha = 1
                
            }
                
            else if (emailKayenImageView.frame.origin.x > 160) {
                
                // Turns background to red
                emailListBgView.backgroundColor = UIColorFromRGB(0xEB5433)
                
                // Icons should move with email image
                archiveDeleteIconWrapperView.frame.origin.x = emailKayenImageView.frame.origin.x - 18 - 25
                
                // Show Delete icon, hide Arhive icon
                deleteIconImageView.alpha = 1
                archiveIconImageView.alpha = 0
                
            }
            
            
        }
            
        // End panning
        else if sender.state == UIGestureRecognizerState.Ended {
            
            // Show Reschedule
            // If x is less than 60, hide row by animating to left
            if (emailKayenImageView.frame.origin.x < -60 && emailKayenImageView.frame.origin.x > -160) {
                
                
                // Animate Email List (email + icon)
                UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.emailListView.frame.origin.x = -320
                    
                    }, completion: nil)
                
                // Show reschedule
                showRescheduleOverlay()
                
            }
                
            else if (emailKayenImageView.frame.origin.x < -160) {
                
                showListOptions()
                
            }
                
            else if (emailKayenImageView.frame.origin.x > 60 && emailKayenImageView.frame.origin.x < 160) {
                
                // Animate Email List (email + icon)
                UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.emailListView.frame.origin.x = 320
                    
                    }, completion: nil)
                
                hideEmail()
                
            }
                
            else if (emailKayenImageView.frame.origin.x > 160) {
               
                // Animate Email List (email + icon)
                UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.emailListView.frame.origin.x = 320
                    
                    }, completion: nil)
                
                hideEmail()
                
            }
            
            // If x is less than 60, hide row by animating to left
            else {
                
                // Animate email content only
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.emailKayenImageView.frame.origin.x = 0
                    
                    
                    }, completion: nil)
                
                // Turn bg color back to grey
                emailListBgView.backgroundColor = UIColorFromRGB(0xE2E2E2)
                
            }
            
        }
        
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
