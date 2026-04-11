//
//  LocationManager.swift
//  IdleFish
//
//  Created by Mac Mini on 2026/4/1.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var manager: CLLocationManager = CLLocationManager()

    @Published var cityName: String?

    override init() {
        super.init()

        manager.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else {
            return
        }

        // 通过地理反编码得到位置的详细信息
        let geoc = CLGeocoder()

        geoc.reverseGeocodeLocation(CLLocation(latitude: location.latitude, longitude: location.longitude)) {
            placemarks, _ in

            guard let placemark = placemarks?.first else {
                return
            }

            // locality就表示当前定位的城市名称
            guard let name = placemark.locality else {
                return
            }

            DispatchQueue.main.async {
                print(name)
                //闲鱼上只显示城市名称
                self.cityName = String(name.prefix(name.count - 1))
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
