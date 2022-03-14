//
//  MyMap.swift.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/12.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct MyMapView:UIViewRepresentable{
//    @State var myPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(37.331705), longitude: CLLocationDegrees(-122.030237)),span: MKCoordinateSpan())
    var locationManager = CLLocationManager()
    typealias UIViewType = MKMapView
    
    func makeUIView(context: Context) -> MKMapView {
        let mkMapView = MKMapView()
        mkMapView.delegate = context.coordinator
        //위치 매니저 delegate
        locationManager.delegate = context.coordinator
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mkMapView.showsUserLocation = true//유저 표시
        mkMapView.setUserTrackingMode(.follow, animated: true)//따라오는지
        let regionRadius : CLLocationDistance = 20
        let coordinateRegion = MKCoordinateRegion(center: mkMapView.userLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mkMapView.setRegion(coordinateRegion, animated: true)
        return mkMapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return MyMapView.Coordinator(self)
    }
    
    class Coordinator: NSObject{
        var myMapView: MyMapView
        
        init(_ myMapView: MyMapView){
            self.myMapView = myMapView
        }
    }

}

struct MyMapView_Previews: PreviewProvider{
    static var previews: some View{
        MyMapView()
    }
}

extension MyMapView.Coordinator: MKMapViewDelegate{
    
}

extension MyMapView.Coordinator: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lat = locations.first?.coordinate.latitude, let long = locations.first?.coordinate.longitude else{
            return
        }
    }
}
