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

class AddGeotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var zoomButton: UIBarButtonItem!
    @IBOutlet weak var eventTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var radiusCell = RadiusCell()
    
    var delegate: AddGeotificationsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.tableView.backgroundColor? = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.navigationBar.backgroundColor? = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        navigationItem.rightBarButtonItems = [addButton, zoomButton]
        addButton.isEnabled = true
    }

//    @IBAction func textFieldEditingChanged (sender: UITextField) {
//        addButton.isEnabled = radiusCell.radiusTextField!.text!.isEmpty && radiusCell.noteTextField!.text!.isEmpty
//    }

//    @IBAction func onCancel (sender: AnyObject) {
//        dismiss(animated: true, completion: nil)
//    }

    @IBAction private func onAdd (sender: UIBarButtonItem) {
        let rowToSelect = IndexPath(row: 0, section: 0)
        radiusCell = tableView.cellForRow(at: rowToSelect) as! RadiusCell

        let coordinate = mapView.centerCoordinate
        let radius = Double(radiusCell.radiusTextField.text!)!
        let identifier = NSUUID().uuidString
        let note = radiusCell.noteTextField.text
        let eventType: EventType = (eventTypeSegmentedControl.selectedSegmentIndex == 0) ? .onEntry : .onExit
        delegate?.addGeotificationViewController(controller: self, didAddCoordinate: coordinate, radius: radius, identifier: identifier, note: note!, eventType: eventType)
    }

    @IBAction private func onZoomToCurrentLocation (sender: UIBarButtonItem) {
        mapView.zoomToUserLocation()
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "radiusCell", for: indexPath) as! RadiusCell
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
