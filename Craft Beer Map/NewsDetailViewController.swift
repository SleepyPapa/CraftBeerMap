//
//  NewsDetailViewController.swift
//  CraftBeerMap
//
//  Created by Daddy on 2015-10-30.
//  Copyright © 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var newsTitle=""
    var newsDetail=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textViewToUpdate = self.view.viewWithTag(70) as! UILabel
        textViewToUpdate.text = newsTitle
        let secondTextViewToUpdate = self.view.viewWithTag(71) as! UILabel
        secondTextViewToUpdate.text = newsDetail

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
