//
//  MapViewController.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/7/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let client = FourSquareClient()
    
    var location: CLLocation? {
        didSet {
            guard let lat = location?.coordinate.latitude, let long = location?.coordinate.longitude else {
                return
            }
            
            client.getLocationsFor(category: .coffeeShop, forLattitude: lat, longitude: long)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        determineCurrentLocation()
        client.delegate = self
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func determineCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    /*
    // MARK: - Navigation
 */

}

extension MapViewController: FourSquareClientDelegate {
    func client(_ client: FourSquareClient, didGet venues: [FourSquareVenue], in category: FourSquareCategory) {
        // Drop a pin at user's Current Location
        venues.forEach { venue in
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(venue.location.lat, venue.location.lng);
            myAnnotation.title = venue.name
            mapView.addAnnotation(myAnnotation)
        }
    }
    
    func client(_ client: FourSquareClient, didFailWith error: String) {
        
    }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        self.location = userLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error \(error)")
    }
}
