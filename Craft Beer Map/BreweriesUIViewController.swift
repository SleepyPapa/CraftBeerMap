//
//  BreweriesUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class BreweriesUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "BreweriesCell"
    
    
    
    let arrayBreweries = ["Swans Brewpub",
        "Spinnakers Gastro Brewpub",
        "The Moon under Water Brewpub",
        "Lighthouse Brewing","Hoyne Brewing",
        "Driftwood Brewery",
        "Canoe Brewpub",
        "Phillips Brewing",
        "Vancouver Island Brewery"]
    let arrayDescription = ["After a beautiful renovation completed in 1989, Swans is filled with founder Michael William's remarkable art collection. You can visit a statue of Michael sitting on a bench across the street.",
        "Spinnakers became Canada's first brewpub in 1984 and has been going strong ever since. Take in the amazing harbour views with great beer and food at the cradle of the Craft Beer Revolution.",
        "Named for George Orwell's fictional 'Perfect Pub,' the Moon is a popular spot with a strong focus on German styles, include a Pilsner, Dunkel, and the beft Hefweizen in BC.","Lighthouse's nautical-themed lineup offers something for everyone. Loof for its beers on tap or for sale in liquor stores throughout Greater Victoria.",
        "Sean Hoyne is a local favourite who started brewing at Swans Brewpub in 1989 and then moved over to Canoe Brewpub in 1996. He finally opened his own brewery in 2011.",
        "Driftwood's solid lineup is headlined by one of BC's most popular craft beers, Fat Tug IPA. The brewery is also blazing new trails with its sour/barrel aged program.",
        "Situated in the beautifully renovated City Lights building (built 1894), Canoe is a great spot to drink beer. Outside, it has Victoria's best west-facing patio right down on the water.",
        "Since opening in 2001, this 'little brewery that could' has grown into one of BC's biggest and best. The Phillips Backyard hosts several events throughout the summer months.",
        "A longtime Island favourite, VIB was originally founded as Island Pacific Brewing in 1984. Look for popular brands like Piper's Pale Ale and Hermann's Dark Lager throughout Greater Victoria."]
    let arrayLocations = ["506 Pandora Ave, Victoria, BC.\n\n250 361 3310\n\nhttp://swanshotel.com/brew-pub",
        "308 Catherine Street, Victoria, BC.\n\n250.386.2739\n\nhttp://spinnakers.com",
        "350B Bay St, Victoria, BC.\n\n250.380.0706\n\nhttp://moonunderwater.ca",
        "2-836 Devonshire Rd, Victoria, BC.\n\n250.383.6500\n\nhttp://lighthousebrewing.com",
        "101-2740 Bridge St, Victoria, BC.\n\n250.383.5758\n\nhttp://hoynebrewing.com",
        "102-450 Hillside Ave, Victoria, BC.\n\n250.381.2739\n\nhttp://driftwoodbeer.com",
        "450 Swift St, Victoria, BC.\n\n250.361.1940\n\nhttp://canoebrewpub.com",
        "2010 Goverment St, Victoria, BC.\n\n250.386.2739\n\nhttp://phillipsbeer.com",
        "2010 View Street, Victoria, BC.\n\n250.361.0005\n\nhttp://vanislandbrewery.com"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = arrayBreweries[row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBreweries.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueBrewer") {
            var svc = segue.destinationViewController as! BrewerDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow()?.row {
            svc.brewerName = arrayBreweries[currentIndex]
            svc.brewerDescription = arrayDescription[currentIndex]
                svc.brewerDetails = arrayLocations[currentIndex]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
