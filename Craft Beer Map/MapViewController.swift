//
//  ViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 48.428703, longitude: -123.372134) //Downtown Victoria
        centerMapOnLocation(initialLocation)
        mapView.delegate = self
        var interestingLocations = [RelevantLocations]()
        
        let tapHouse = RelevantLocations(title: "Yates Street Taphouse",
            locationName: "Yates Street",
            discipline: "Tap House",
            coordinate: CLLocationCoordinate2D(latitude: 48.4259337, longitude: -123.3633245))
        interestingLocations.append(tapHouse)
        let tapHouse2 = RelevantLocations(title: "The Drake Eatery",
            locationName: "The Drake",
            discipline: "BrewPub",
            coordinate: CLLocationCoordinate2D(latitude: 48.4284105, longitude: -123.3692628))
        interestingLocations.append(tapHouse2)
        let tapHouse3 = RelevantLocations(title: "Canoe",
            locationName: "Canoe",
            discipline: "BrewPub",
            coordinate: CLLocationCoordinate2D(latitude: 48.429472, longitude: -123.370820))
        interestingLocations.append(tapHouse3)
        let tapHouse4 = RelevantLocations(title: "Swans Hotel and Brew Pub",
            locationName: "Swans",
            discipline: "BrewPub",
            coordinate: CLLocationCoordinate2D(latitude: 48.4286065, longitude: -123.3695022))
        interestingLocations.append(tapHouse4)
        let tapHouse5 = RelevantLocations(title: "Vancouver Island Brewing",
            locationName: "VIB",
            discipline: "Brewery",
            coordinate: CLLocationCoordinate2D(latitude: 48.4348687, longitude:  -123.367369))
        interestingLocations.append(tapHouse5)
        let tapHouse6 = RelevantLocations(title: "Phillips",
            locationName: "Phillips",
            discipline: "Brewery",
            coordinate: CLLocationCoordinate2D(latitude: 48.4322053, longitude: -123.367329))
        interestingLocations.append(tapHouse6)
        let tapHouse7 = RelevantLocations(title: "Spinnakers",
            locationName: "Spinnakers",
            discipline: "BrewPub",
            coordinate: CLLocationCoordinate2D(latitude: 48.429141, longitude: -123.384874))
        interestingLocations.append(tapHouse7)
        let tapHouse8 = RelevantLocations(title: "Hoyne Brewing",
            locationName: "Hoyne",
            discipline: "Brewery",
            coordinate: CLLocationCoordinate2D(latitude: 48.437602, longitude: -123.373715))
        interestingLocations.append(tapHouse8)
        let tapHouse9 = RelevantLocations(title: "Bard and Banker",
            locationName: "Bard and Banker",
            discipline: "Tap House",
            coordinate: CLLocationCoordinate2D(latitude: 48.424895, longitude: -123.367954))
        interestingLocations.append(tapHouse9)
        let tapHouse10 = RelevantLocations(title: "Irish Times",
            locationName: "Irish Times",
            discipline: "Tap House",
            coordinate: CLLocationCoordinate2D(latitude: 48.425721, longitude: -123.367764))
        interestingLocations.append(tapHouse10)

        
        mapView.addAnnotations(interestingLocations)
        
   }
    
    let regionRadius: CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

