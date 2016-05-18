//
//  FirstViewController.swift
//  LNPopUpControllerAVPlayer
//
//  Created by Axel Destagnol on 18/05/2016.
//  Copyright © 2016 ClapCharts. All rights reserved.
//

import UIKit
import LNPopupController

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createPopUp(sender: UIButton) {
        
        let popupContentController = storyboard?.instantiateViewControllerWithIdentifier("Player") as! PlayerViewController
        
        popupContentController.popupItem.title = "Title"
        popupContentController.popupItem.subtitle = "Artist"
        
        tabBarController?.presentPopupBarWithContentViewController(popupContentController, animated: true, completion: nil)
    }


}

