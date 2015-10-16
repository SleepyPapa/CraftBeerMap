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
    var beerImage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewToUpdate = self.view.viewWithTag(20) as! UITextView
        textViewToUpdate.text = beerBrewer
        let secondTextViewToUpdate = self.view.viewWithTag(21) as! UITextView
        secondTextViewToUpdate.text = beerDescription
        let imageViewToUpdate = self.view.viewWithTag(22) as! UIImageView
        
        let image : UIImage = UIImage(named: "phillips.png")!
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
