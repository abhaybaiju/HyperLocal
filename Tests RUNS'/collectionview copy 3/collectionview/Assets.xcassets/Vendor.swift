//
//  Vendor.swift
//  collectionview
//
//  Created by Abhay Baiju on 05/11/18.
//  Copyright © 2018 Abhay Baiju. All rights reserved.
//

import Foundation
import MapKit
import Contacts
class Vendor : NSObject,MKAnnotation{
    let title:String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    init(title: String,locationName: String, coordinate : CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    var subtitle: String? {
        return locationName
    }
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
