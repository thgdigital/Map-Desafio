//
//  WheaterMapViewController.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SDWebImage
import RNActivityView

class WheaterMapViewController: UIViewController {
    
    var presenter: WheaterPresenterInput?
    
    var items: [ArtworkItem] = []
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.isZoomEnabled = false
        
        executeInBackground {
            self.presenter?.viewDidLoad()
        }
        
    }
}
extension WheaterMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "annotationID"
        
        guard let annotationCustom = annotation as? ArtworkItem else { return nil }

        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotationCustom, reuseIdentifier: reuseId)
            pinView?.isEnabled = true
            pinView?.canShowCallout = true
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: pinView!.frame.height - 20.0 , height: pinView!.frame.width - 20.0))
            imageView.sd_setImage(with: URL(string: annotationCustom.urlImage), completed: nil)
            pinView?.leftCalloutAccessoryView = imageView
            pinView?.image = UIImage(named: "marke")
            
        }else{
            pinView?.annotation = annotationCustom
        }
        
        return pinView
    }
}

extension WheaterMapViewController: WheaterPresenterOuput {
    
    func startLoading() {
        executeOnMainQueue {
            self.navigationController?.view.showActivityView(withLabel: "Buscando Dados..")
        }
    }
    
    func hiddenLoading() {
        executeOnMainQueue {
            self.navigationController?.view.hideActivityView()
            
        }
    }
    
    func startMap(lat: Double, long: Double, radius: Double) {
        
        executeOnMainQueue {
            let coordinate = CLLocationCoordinate2DMake(lat, long)
            let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                      latitudinalMeters: radius, longitudinalMeters: radius)
            self.mapView.setRegion(coordinateRegion, animated: true)
        }
    }
    
    func fetched(artworkItem: [ArtworkItem]) {
        
        executeOnMainQueue {
            self.mapView.removeAnnotations(self.items)
            self.items = artworkItem
            self.mapView.addAnnotations(self.items)
        }
    }
    
    func alertView(title: String, description: String) {
        executeOnMainQueue {
            UIAlertController.showAlert(title: title, message: description, cancelButtonTitle: "OK", viewController:self)
        }
    }
}
