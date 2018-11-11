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
        let initialLocation = CLLocation(latitude: 13.3525, longitude: 74.7921)
        let regionRadius: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            Map.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        Map.delegate = self as? MKMapViewDelegate
        let vendor1 = Vendor(title: "Chai Stall1", locationName: "Location",
                              coordinate: CLLocationCoordinate2D(latitude: 13.3479, longitude: 74.7923))
        Map.addAnnotation(vendor1)
        let vendor2 = Vendor(title: "Chai Stall2", locationName: "Location",
                            coordinate: CLLocationCoordinate2D(latitude: 13.3449, longitude: 74.7923))
        Map.addAnnotation(vendor2)
        let vendor3 = Vendor(title: "Chai Stall3", locationName: "Location",
                            coordinate: CLLocationCoordinate2D(latitude: 13.3479, longitude: 74.7943))
        Map.addAnnotation(vendor3)
        let vendor4 = Vendor(title: "Chai Stall4", locationName: "Location",
                            coordinate: CLLocationCoordinate2D(latitude: 13.3449, longitude: 74.7943))
        Map.addAnnotation(vendor4)
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
