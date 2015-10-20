//
//  BeerDetailViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    var beerName=""
    var beerDescription=""
    var beerBrewer=""
    var beerImage=""
    var beerABV=""
    var beerStyle=""
    var beerReviewDate=""
    var imageToPost:UIImage? = nil {

        didSet{
            let imageViewToUpdate = self.view.viewWithTag(22) as! UIImageView
            imageViewToUpdate.image = imageToPost
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textViewToUpdate = self.view.viewWithTag(20) as! UITextField
        textViewToUpdate.text = beerBrewer
        let secondTextViewToUpdate = self.view.viewWithTag(21) as! UITextView
        secondTextViewToUpdate.text = beerDescription
        let imageViewToUpdate = self.view.viewWithTag(22) as! UIImageView
        let pathName=("http://victoriabeers.com/")+beerImage
        imageViewToUpdate.imageFromUrl(pathName)
        let thirdTextViewToUpdate = self.view.viewWithTag(23) as! UITextField
        thirdTextViewToUpdate.text = beerName
        let fourthTextViewToUpdate = self.view.viewWithTag(24) as! UITextField
        fourthTextViewToUpdate.text = beerABV
        let fifthTextViewToUpdate = self.view.viewWithTag(25) as! UITextField
        fifthTextViewToUpdate.text = beerStyle
        let sixthTextViewToUpdate = self.view.viewWithTag(26) as! UITextField
        sixthTextViewToUpdate.text = beerReviewDate
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
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                self.image = UIImage(data: data!)
            }
        }
    }
}
