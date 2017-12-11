//
//  HomeVC.swift
//  Depo
//
//  Created by Minjung Kim on 16/11/17.
//  Copyright © 2017 June Kim. All rights reserved.


import UIKit
import MapKit
import CoreLocation




class HomeVC: UIViewController, CLLocationManagerDelegate  {

    
   let locationManager = CLLocationManager()
    
    @IBOutlet weak var myAddressView: UITextField!
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier:"toSearch", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
    locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            print(myLocation)
        
        
     CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil
            {
                print("There was an error")
                
            }
            else {
                if let place = placemark?[0]
                
                {
                    
                    self.myAddressView.text = "\(place.administrativeArea!)" + " " + "\(place.locality!)" + " " + "\(place.subLocality!)" + " " + "\(place.subThoroughfare!)"
                    
                }
            }
          }
            
        
            
        }
    
            
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
        showLocationDisabledPopup()
    }
    }
        
        func showLocationDisabledPopup() {
            let alertController = UIAlertController(title : "Location Access Disabled", message: "예약 장소까지 이동시간을 알아보기 위해서 현재 위치가 필요 합니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler:nil)
            alertController.addAction(cancelAction)
            
            let openAction =  UIAlertAction(title: "Open settings",style: .default) {(action) in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        
            alertController.addAction(openAction)
            self.present(alertController, animated: true, completion: nil)
            
            }
        
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

