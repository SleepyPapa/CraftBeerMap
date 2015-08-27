//
//  TapHouseDetailViewController.swift
//  CraftBeerMap
//
//  Created by Daddy on 2015-08-24.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class TapHouseDetailViewController: UIViewController {
    var tapHouseName: String!
    var tapHouseLocation: String!
    var tapHouseDescription: String!
    var tapHouseImage: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var textViewToUpdate = self.view.viewWithTag(30) as! UITextView
        textViewToUpdate.text = tapHouseLocation
        var secondTextViewToUpdate = self.view.viewWithTag(31) as! UITextView
        secondTextViewToUpdate.text = tapHouseDescription
        var imageViewToUpdate = self.view.viewWithTag(32) as! UIImageView
        var image : UIImage = UIImage(named: tapHouseImage)!
        imageViewToUpdate.image = image

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
