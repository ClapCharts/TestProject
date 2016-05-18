//
//  PlayerViewController.swift
//  LNPopUpControllerAVPlayer
//
//  Created by Axel Destagnol on 18/05/2016.
//  Copyright © 2016 ClapCharts. All rights reserved.
//

import UIKit
import LNPopupController
import AVFoundation

class PlayerViewController: UIViewController {

    var player = AVPlayer()
    var timeObserver: AnyObject!

    @IBOutlet weak var timer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.popupItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "SmallPlayer_Pause"), style: .Plain, target: nil, action: nil)]
        self.popupItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "SmallPlayer_More"), style: .Plain, target: nil, action: nil)]
        
        LNPopupCloseButton.appearance().hidden = true
        
        LNPopupBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont(name: "AvenirNext-Medium", size: 13)!, NSForegroundColorAttributeName:UIColor.blackColor()]
        LNPopupBar.appearance().subtitleTextAttributes = [NSFontAttributeName:UIFont(name: "Avenir Next", size: 11)!, NSForegroundColorAttributeName:UIColor.blackColor()]
        LNPopupBar.appearance().barTintColor = UIColor.whiteColor()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playButtonPressed(sender: UIButton) {
        if let url = NSURL(string: "http://clapcharts.com/track/Love.mp3") {
            player = AVPlayer(URL: url)
            player.play()
        
            timeObserver = player.addPeriodicTimeObserverForInterval(CMTimeMakeWithSeconds(1, 1), queue: nil, usingBlock: { (elapsedTime: CMTime) -> Void in
                
                self.updateTimer(elapsedTime)
            })
        }
    }
    
    private func updateTimer(elapsedTime: CMTime) {
        
        let duration = CMTimeGetSeconds(player.currentItem!.duration);
        if (isfinite(duration)) {
            let elapsedTime = CMTimeGetSeconds(elapsedTime)
            timer.text = String(format: "%d:%02d", (lround(elapsedTime) / 60), lround(elapsedTime) % 60)
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
