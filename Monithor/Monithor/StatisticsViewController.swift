//
//  StatisticsView.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 31/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet var chart: Chart!
    
    let raspIP = "10.20.40.24"
    var misuraClassMG = [DB_Misura]()
    let colors = [UIColor]([.red, .brown, .blue])
    
    override func viewDidLoad() {
        navigationController?.navigationBar.tintColor = UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)]
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        
        self.getMisure()
    }
    
    func getMisure () {
        
        //Our web service url
        let URL_GET_Misura_m:String = "http://\(raspIP)/monithor/api/GetMisura_m.php"
        
        //created NSURL
        let requestURL = NSURL(string: URL_GET_Misura_m)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "GET"
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            //exiting if there is some error
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                var prioritaJSON: NSDictionary!
                prioritaJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                let misura_m = prioritaJSON["misura_m"] as! [NSDictionary]
                var seriesValues = [[Float]]()
                
                seriesValues.append([])
                seriesValues.append([])
                seriesValues.append([])
                seriesValues.append([])
                
                dump(misura_m)
                //looping through all the json objects in the array teams
                for i in 0 ..< misura_m.count{
                    
                    //getting the data at each index
                    let misuraM = DB_Misura()
                    misuraM.setIDPresa(misura_m[i]["id_presa"] as! Int!)
                    misuraM.setLettura(misura_m[i]["lettura"] as! Int!)
                    misuraM.setQuando(misura_m[i]["quando"] as! String!)
                    print(misuraM.getIdPresa - 1)
                    seriesValues[misuraM.getIdPresa - 1].append(Float(abs(misuraM.getLettura)) / 10)
                    self.misuraClassMG.append(misuraM)
                    
                }
                
                seriesValues.removeLast()
                var i = 0
                for serieValue in seriesValues {
                    dump(serieValue)
                    let series = ChartSeries(serieValue)
                    series.color = self.colors[i % self.colors.count]
                    series.area = true
                    i += 1
                    self.chart.add(series)
                    self.chart.showXLabelsAndGrid = false
                    DispatchQueue.main.async {
                        self.chart.setNeedsDisplay()
                    }
                }
                
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
    }

    
}
