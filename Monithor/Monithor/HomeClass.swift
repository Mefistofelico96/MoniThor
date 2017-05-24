//
//  HomeClass.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 24/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import Foundation

public class Parametri_Home {
    
    private var  id: Int = 0
    private var  nome: String = ""
    private var  stato: Int = 0
    private var  id_presa: Int = 0
    private var  stato_timer: Int = 0
    private var  timer_on: String = ""
    private var  timer_off: String = ""
    
    init () {
        
    }
    
    init (id: Int, nome: String ,stato: Int, id_presa: Int, stato_timer: Int ,timer_on: String, timer_off: String){
        self.id=id;
        self.nome=nome;
        self.stato=stato;
        self.id_presa = id_presa;
        self.stato_timer = stato_timer;
        self.timer_on = timer_on;
        self.timer_off = timer_off;
    }
    
    init (id: Int, nome: String ,stato: Int, stato_timer: Int ,timer_on: String, timer_off: String){
        self.id=id;
        self.nome=nome;
        self.stato=stato;
        self.stato_timer = stato_timer;
        self.timer_on = timer_on;
        self.timer_off = timer_off;
    }
    
    
    init (id: Int, nome: String ,stato: Int){
        self.id=id;
        self.nome=nome;
        self.stato=stato;
    }
    
    init (id_presa: Int, stato_timer: Int ,timer_on: String, timer_off: String){
        
        self.id_presa = id_presa;
        self.stato_timer = stato_timer;
        self.timer_on = timer_on;
        self.timer_off = timer_off;
        
    }
    
    
    
    //get Id
    var getId: Int {
        get {
            return self.id
        }
    }
    init(id: Int) {
        self.id = id
    }
    
    //get Nome
    var getNome: String {
        get {
            return self.nome
        }
    }
    init(nome: String) {
        self.nome = nome
    }
    
    
    //get Stato
    var getStato: Int {
        get {
            return self.stato
        }
    }
    
    init(stato: Int) {
        self.stato = stato
    }
    
    
    
    //get Id_presa
    var getId_presa: Int {
        get {
            return self.id_presa
        }
    }
    
    init(id_presa: Int) {
        self.id_presa = id_presa
    }
    
    //get Stato_timer
    
    var getStato_timer: Int {
        get {
            return self.stato_timer
        }
    }
    
    init(stato_timer: Int) {
        self.stato_timer = stato_timer
    }
    
    
    //get Timer_on
    
    var getTimer_on: String {
        get {
            return self.timer_on
        }
    }
    
    init(timer_on: String) {
        self.timer_on = timer_on
    }
    
    
    //get Timer_off
    
    var getTimer_off: String {
        get {
            return self.timer_off
        }
    }
    
    init(timer_off: String) {
        self.timer_off = timer_off
    }
    
    
    
}
