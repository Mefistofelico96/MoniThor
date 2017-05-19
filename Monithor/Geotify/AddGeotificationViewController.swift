//
//  AddGeotificationViewController.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 15/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit
import MapKit

protocol AddGeotificationsViewControllerDelegate {
  func addGeotificationViewController(controller: AddGeotificationViewController, didAddCoordinate coordinate: CLLocationCoordinate2D,
    radius: Double, identifier: String, note: String, eventType: EventType)
}

class AddGeotificationViewController: UIViewController {

    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var zoomButton: UIBarButtonItem!
    @IBOutlet weak var eventTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var radiusCell: RadiusCell!

    var delegate: AddGeotificationsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.rightBarButtonItems = [addButton, zoomButton]
//        addButton.isEnabled = false
    }

    @IBAction func textFieldEditingChanged(sender: UITextField) {
        addButton.isEnabled = radiusCell.radiusTextField.text!.isEmpty && radiusCell.noteTextField.text!.isEmpty
    }

    @IBAction func onCancel(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func onAdd(sender: AnyObject) {
        let coordinate = mapView.centerCoordinate
        let radius = Double(radiusCell.radiusTextField.text!) ?? 0
        let identifier = NSUUID().uuidString
        let note = radiusCell.noteTextField.text
        let eventType: EventType = (eventTypeSegmentedControl.selectedSegmentIndex == 0) ? .onEntry : .onExit
        delegate?.addGeotificationViewController(controller: self, didAddCoordinate: coordinate, radius: radius, identifier: identifier, note: note!, eventType: eventType)
    }

    @IBAction private func onZoomToCurrentLocation(sender: AnyObject) {
        mapView.zoomToUserLocation()
    }
}
