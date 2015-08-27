//
//  ToursDetailViewController.swift
//  CraftBeerMap
//
//  Created by Daddy on 2015-08-27.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class ToursDetailViewController: UIViewController {

    var toursInformation: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textViewToUpdate = self.view.viewWithTag(40) as! UITextView
        textViewToUpdate.text = toursInformation

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
