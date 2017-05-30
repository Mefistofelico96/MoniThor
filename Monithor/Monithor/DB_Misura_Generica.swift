//
//  DB_Misura_Generica.swift
//  Monithor
//
//  Created by Carlo Lomello on 30/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import Foundation

public class DB_Misura {
    
    private var  id_presa: Int = 0
    private var  lettura: Int = 0
    private var  quando: String = ""
   
    
    init () {
        
    }
    
    init (id_presa: Int, lettura: Int ,quando: String){
        self.id_presa = id_presa
        self.lettura = lettura
        self.quando = quando
    }
    
    
    //get Id_Presa
    var getIdPresa: Int {
        get {
            return self.id_presa
        }
    }
    init(id_presa: Int) {
        self.id_presa = id_presa
    }
    
    //set Id_Presa
    func setIDPresa (_ id_presa: Int) {
        self.id_presa = id_presa
    }

    //get lettura
    var getLettura: Int {
        get {
            return self.lettura
        }
    }
    init(lettura: Int) {
        self.lettura = lettura
    }
    
    //set lettura
    func setLettura (_ lettura: Int) {
        self.lettura = lettura
    }
    
    // Get quando
    var getQuando: String {
        get {
            return self.quando
        }
    }
    
    // Set nome
    func setQuando (_ quando: String) {
        self.quando = quando
    }
    
    init (quando: String) {
        self.quando = quando
    }
    

    
    
}
