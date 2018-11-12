//
//  MapViewController.swift
//  collectionview
//
//  Created by Abhay Baiju on 05/11/18.
//  Copyright © 2018 Abhay Baiju. All rights reserved.
//

import UIKit
import MapKit


class MapViewController4: UIViewController {
    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let initialLocation = CLLocation(latitude: 13.3449, longitude: 74.7910)
        let regionRadius: CLLocationDistance = 300
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            Map.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        Map.delegate = self as? MKMapViewDelegate
        let vendor = Vendor(title: "Chai Stall 1", locationName: "Location",
                              coordinate: CLLocationCoordinate2D(latitude: 13.3447, longitude: 74.7904))
        Map.addAnnotation(vendor)
        let vendor1 = Vendor(title: "Chai Stall 2", locationName: "Location",
                            coordinate: CLLocationCoordinate2D(latitude: 13.3437, longitude: 74.7904))
        Map.addAnnotation(vendor1)
        let vendor2 = Vendor(title: "Chai Stall 3", locationName: "Location",
                            coordinate: CLLocationCoordinate2D(latitude: 13.3433, longitude: 74.7910))
        Map.addAnnotation(vendor2)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
extension MapViewController4: MKMapViewDelegate {
    // 1
    func mapView4(_ Map: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Vendor else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = Map.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    func mapView4(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Vendor
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
