//
//  DB_Priorita.swift
//  Monithor
//
//  Created by Carlo Lomello on 29/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import Foundation

public class DB_Priorita {
    private var  id_presa: Int = 0
    private var  priorita_presa: Int = 0
    
    
    init() {
        
    }
    
    init (id_presa: Int, priorita_presa: Int){
        self.id_presa = id_presa
        self.priorita_presa = priorita_presa
        
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
    
    //get Priorita_Presa
    var getPrioritaPresa: Int {
        get {
            return self.priorita_presa
        }
    }
    init(priorita_presa: Int) {
        self.priorita_presa = priorita_presa
    }
    
    //set Id_Presa
    func setPrioritaPresa (_ priorita_presa: Int) {
        self.priorita_presa = priorita_presa
    }
    
    
    
    
    
}
