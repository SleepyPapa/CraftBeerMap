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
    var toursLocation: String!
    var swigName: String!
    var swigImage: String!
    var swigLine: String!
    var swigReview: String!
    var swigDate: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewToUpdate = self.view.viewWithTag(41) as! UITextField
        textViewToUpdate.text = swigName
        let textViewToUpdate2 = self.view.viewWithTag(40) as! UILabel
        textViewToUpdate2.text = swigReview
        let textViewToUpdate3 = self.view.viewWithTag(42) as! UITextField
        textViewToUpdate3.text = swigDate
        let imageViewToUpdate = self.view.viewWithTag(44) as! UIImageView
        let pathName=("http://victoriabeers.com/")+swigImage
        imageViewToUpdate.imageFromUrl(pathName)
//        let textViewToUpdate4 = self.view.viewWithTag(43) as! UITextView
//        textViewToUpdate4.text = swigLine

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
