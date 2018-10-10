////
////  FCLocationManager.swift
////  FoodaCoffee
////
////  Created by Noah Malmed on 10/8/18.
////  Copyright © 2018 Noah Malmed. All rights reserved.
////
//
//import CoreLocation
//
//class FCLocationManager {
//    let locationManager = CLLocationManager()
//    
//    var currentLocation: CLLocation?
//    
//    // Stub out constructor to enforce
//    private FCLocationManager() {}
//}
//
//extension FCLocationManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let userLocation:CLLocation = locations[0] as CLLocation
//        
//        // Call stopUpdatingLocation() to stop listening for location updates,
//        // other wise this function will be called every time when user location changes.
//        //manager.stopUpdatingLocation()
//        
//        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        
//        // Drop a pin at user's Current Location
//        //        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
//        //        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
//        //        myAnnotation.title = "Current location"
//        //        mapView.addAnnotation(myAnnotation)
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
//        print("Error \(error)")
//    }
//}
