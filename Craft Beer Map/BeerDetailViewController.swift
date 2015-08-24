//
//  BeerDetailViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    var beerName:String!
    var beerDescription:String!
    var beerBrewer:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textViewToUpdate = self.view.viewWithTag(20) as! UITextView
        textViewToUpdate.text = beerBrewer
        var secondTextViewToUpdate = self.view.viewWithTag(21) as! UITextView
        secondTextViewToUpdate.text = beerDescription
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
