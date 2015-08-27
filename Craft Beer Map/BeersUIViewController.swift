//
//  BeersUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit
import CoreData

class BeersUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "BeersCell"
    var beersData:[(beerName: String, beerBrewer: String, beerDescription: String, beerImage: String)] = []
    
    
    let arrayBeers = ["Blue Buck", "Sea Dog", "Amber Ale"]
    let arrayBrewer = ["Phillips Brewing Company\n2010 Government Street\nVictoria, BC V8T 4PI\n info@phillipsbeer.com\n(250)380-1912",
        "Vancouver Island Brewery",
        "Hoynes"]
    let arrayDescriptions = ["Blue Buck, some background text about the taste of the beer and anything else from the website.",
        "Sea Dog",
        "Amber Ale"]
    var beers = [NSManagedObject] ()
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        //        let beer = beers[indexPath.row]
        //        cell.textLabel!.text = beer.valueForKey("beerName") as? String
        cell.textLabel!.text = beersData[indexPath.row].beerName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showBeerDetail") {
            var svc = segue.destinationViewController as! BeerDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow()?.row {
                svc.beerDescription = beersData[currentIndex].beerDescription
                svc.beerBrewer = beersData[currentIndex].beerBrewer
                svc.beerImage = beersData[currentIndex].beerImage
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpTuples()
    }
    
    func setUpTuples(){
        beersData.append(beerName: "Blue Buck",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "The Blue Buck is a legendary beast known to grant those that see him good fortune and safe travels! A deep amber coloured beer, the Blue Buck has a crisp finish featuring a delicate hop aroma. Certainly seeing the Blue Buck on bottle grants the drinker a great experience! Worth searching for.",
            beerImage: "phillips.png")
        beersData.append(beerName: "Amnesiac Double IPA",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "Uh, we forget...Oh Yeah, this is a big beer. Mind blowing amounts of hops give this beer tons of flavour and aroma. Not for the faint of heart. The bigger, meaner cousin to the Hop Circle IPA.",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Hop Circle IPA",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "Hoptimization capacitors activated. Taste probe functions optimal. Aroma sensors in overdrive. Engage. Let this otherworldly IPA abduct the hell out of your senses. The gravitational pull of Hop Circle will have you searching the galaxy for another close encounter of the thirst kind. Resistance is futile..",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Longboat Chocolate Porter",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "Classic Pairings in History: Stevie Wonder & Paul McCartney Super Dave Osborne & Mr. Fuji Cheddar cheese & pickles Bob & Doug McKenzie Mork & Mindy Bonnie & Clyde Chocolate & Beer!!! We'd say that Longboat is a classic chocolate porter, but lets face it, who's ever heard of a chocolate porter? It is, however, a rich dark ale, with a distinctive chocolate finish. Comes in a 650mL bottle, cause 341mL just isn't enough!",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Slipstream Cream Ale",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "Duck into the slipstream and enjoy the rich flavours of a BC original! Medium bodied and smooth like pedal stroke.",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Double Dragon Imperial Red Ale",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "A bold majestic ale, with a firey copper hue. The fierce hop flavour battles with an honorable malt base for the affection of your taste buds. Big enough to slay the strongest thirst.",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Dr. Funk Dunkel",
            beerBrewer: "Phillips\n2010 Goverment St, Victoria, BC.\n250.386.2739\nhttp://phillipsbeer.com",
            beerDescription: "Like Shaft, Dolemite and Blacula before him, guess who’s getting his own sequel? That’s right, Dr. Funk is strutting his way back to town for another go round. This Bavarian dark lager was a hit with all the ladies and fellas when the Funk was featured in the Showcase, so we've brought back the grand uncle of dunkel in his own seasonal six-pack.",
            beerImage: "phillips.png")
        
        beersData.append(beerName: "Hermann's Dark Lager",
            beerBrewer: "Vancouver Island Brewery\n2330 Government Street, Victoria, BC.\n250.361.0005\nhttp://vanislandbrewery.com",
            beerDescription: "A proud and passionate Bavarian, Hermann was one of our original Brewmasters. He handcrafted this traditional German recipe to satisfy his longing for a local beer that reflected the true taste of his homeland. Consistently recognized as one of the world’s best dark lagers, this refreshing beer has a toasty malt body, yet is very smooth and finishes clean. We hope you enjoy our authentic Bavarian Dark Lager. Prost!",
            beerImage: "VIB.png")
        
        beersData.append(beerName: "Sea Dog Amber Ale",
            beerBrewer: "Vancouver Island Brewery\n2330 Government Street, Victoria, BC.\n250.361.0005\nhttp://vanislandbrewery.com",
            beerDescription: "Ready, Aye, Ready! We’re proud that our brewery’s hometown is also the base of the Canadian Pacific Naval Fleet. As a tribute to our nation’s Naval heritage, and to commemorate our Canadian Naval Centennial, we’ve crafted a unique beer for a unique occasion. Sea Dog is an amber coloured beer with a burst of hops and smooth malt finish. Here’s to 100 years of protecting our waters, our citizens and our sovereignty...Bravo Zulu!",
            beerImage: "VIB.png")
        
        beersData.append(beerName: "Piper's Pale Ale",
            beerBrewer: "Vancouver Island Brewery\n2330 Government Street, Victoria, BC.\n250.361.0005\nhttp://vanislandbrewery.com",
            beerDescription: "Piper’s Pale Ale was named in honour of Canadian war hero Piper James C. Richardson who was lost during the battle of the Somme during WWI. Awarded a Victoria Cross for his acts of bravery, we were inspired by his dedication and sacrifice to our country. Piper Richardson braved the trenches and began to play his bagpipes, inspiring the troops into battle with fury and determination. After assisting a wounded comrade back to safety and escorting enemy prisoners, he realized he had left his pipes behind and was lost in action while attempting to retrieve them. In Piper’s memory, we salute his bravery and toast in his honour!",
            beerImage: "VIB.png")
        
        beersData.sort({$0.0<$1.0})
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
