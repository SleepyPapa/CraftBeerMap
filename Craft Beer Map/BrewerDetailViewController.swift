//
//  BrewerDetailViewController.swift
//  CraftBeerMap
//
//  Created by Aidan Lavery on 2015-08-17.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class BrewerDetailViewController: UIViewController {
    
    @IBOutlet weak var brewerInformation: UITextView!
    var brewerDescription:String!
    var brewerName:String!
    var brewerDetails:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        var textViewToUpdate = self.view.viewWithTag(12) as! UITextView
        textViewToUpdate.text = brewerDetails
        var secondTextViewToUpdate = self.view.viewWithTag(11) as! UITextView
        secondTextViewToUpdate.text = brewerDescription
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
