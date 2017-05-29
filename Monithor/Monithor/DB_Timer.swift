//
//  DB_Timer.swift
//  Monithor
//
//  Created by Charlie on 24/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import Foundation

public class DB_Timer {
    
    private var  id_presa: Int = 0
    private var  stato_timer: Int = 0
    private var  timer_on: String = ""
    private var  timer_off: String = ""
    
    init () {
        
    }
    
    init (id_presa: Int, stato_timer: Int ,timer_on: String, timer_off: String){
        
        self.id_presa = id_presa;
        self.stato_timer = stato_timer;
        self.timer_on = timer_on;
        self.timer_off = timer_off;
        
    }
    
    // Get IdPresa
    var getIdPresa: Int {
        get {
            return self.id_presa
        }
    }
    
    // Set idPresa
    func setIDPresa (_ id_presa: Int) {
        self.id_presa = id_presa
    }
    
    init (id_presa: Int) {
        self.id_presa = id_presa
    }
    
    // Get StatoTimer
    var getStatoTimer: Int {
        get {
            return self.stato_timer
        }
    }
    
    // Set statoTimer
    func setStatoTimer (_ stato_timer: Int) {
        self.stato_timer = stato_timer
    }
    
    init (stato_timer: Int) {
        self.stato_timer = stato_timer
    }
    
    
    // Get timerOn
    var getTimer_on: String {
        get {
            return self.timer_on
        }
    }
    
    // Set timerOn
    func setTimerOn (_ timer_on: String) {
        self.timer_on = timer_on
    }
    
    init (timer_on: String) {
        self.timer_on = timer_on
    }
    
    
    // Get timerOff
    var getTimer_off: String {
        get {
            return self.timer_off
        }
    }
    
    // Set timerOff
    func setTimerOff (_ timer_off: String) {
        self.timer_off = timer_off
    }
    
    init (timer_off: String) {
        self.timer_off = timer_off
    }
    
}
