//
//  ViewControllerCathegories.swift
//  Monithor
//
//  Created by Cristina Salerno on 16/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerCathegories: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    var plugTypes: [Cathegory] = []
    func setCathegory() {
        plugTypes.append(Cathegory(name: "Coffee Machine", image: #imageLiteral(resourceName: "CoffeeMachine")))
        plugTypes.append(Cathegory(name: "Washing Machine", image: #imageLiteral(resourceName: "WashingMachine")))
        plugTypes.append(Cathegory(name: "Air Cooler", image: #imageLiteral(resourceName: "Cooler")))
        plugTypes.append(Cathegory(name: "TV", image: #imageLiteral(resourceName: "TV")))
        plugTypes.append(Cathegory(name: "Game Console", image: #imageLiteral(resourceName: "PS4")))
        plugTypes.append(Cathegory(name: "Vacuum Cleaner", image: #imageLiteral(resourceName: "Vacuum")))
        plugTypes.append(Cathegory(name: "Dish Washer", image: #imageLiteral(resourceName: "Dishwasher")))
        plugTypes.append(Cathegory(name: "Printer", image: #imageLiteral(resourceName: "Copymachine")))
        plugTypes.append(Cathegory(name: "PC", image: #imageLiteral(resourceName: "PC")))
        plugTypes.append(Cathegory(name: "Mobile Phone", image: #imageLiteral(resourceName: "iPhone")))
        plugTypes.append(Cathegory(name: "Alarm", image: #imageLiteral(resourceName: "Alarm")))
        plugTypes.append(Cathegory(name: "Heater", image: #imageLiteral(resourceName: "Heater")))
        plugTypes.append(Cathegory(name: "Lamp", image: #imageLiteral(resourceName: "Lamp")))
        plugTypes.append(Cathegory(name: "Name", image: #imageLiteral(resourceName: "Air cond")))
        plugTypes.append(Cathegory(name: "Mac Charger", image: #imageLiteral(resourceName: "Mac Charger")))
        plugTypes.append(Cathegory(name: "Food Steamer", image: #imageLiteral(resourceName: "Bimby")))
        plugTypes.append(Cathegory(name: "Telephone", image: #imageLiteral(resourceName: "Telephone")))
        plugTypes.append(Cathegory(name: "CD Player", image: #imageLiteral(resourceName: "CD Player")))
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.collectionView.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plugTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cathegoriesCell", for: indexPath) as! CollectionViewCellCathegories
        
        return aCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
