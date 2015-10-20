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
        let initialLocation = CLLocation(latitude: 48.4253705, longitude: -123.3625502) //Downtown Victoria
        centerMapOnLocation(initialLocation)
        mapView.delegate = self
        let tapHouse = RelevantLocations(title: "Yates Street Taphouse",
            locationName: "Yates Street",
            discipline: "Sculpture",
            coordinate: CLLocationCoordinate2D(latitude: 48.4259337, longitude: -123.3630929))
        
        mapView.addAnnotation(tapHouse)
   }
    
    let regionRadius: CLLocationDistance = 2000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

