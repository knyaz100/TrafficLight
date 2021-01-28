//
//  ViewController.swift
//  TrafficLight
//
//  Created by Vasily Churbanov on 2021-01-28.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    //MARK: Constants & Varables
    fileprivate enum TrafficLightState {
        case lightR
        case lightY
        case lightG
        case lightOff
    }
    
    fileprivate var trafficLightState:TrafficLightState = .lightOff
        
    //MARK: Overriden methods
    
    /// Hides status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /// Handles  user touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        toggleLight()
        updateUI()
        doHaptic()
    }
    
    //MARK: Private methods
    
    /// Change screen color per TrafficLightState
    fileprivate func updateUI() {
        
        switch trafficLightState {
        case .lightOff:
            view.backgroundColor = .black
        case .lightR:
            view.backgroundColor = .red
        case .lightY:
            view.backgroundColor = .yellow
        case .lightG:
            view.backgroundColor = .green
        }
        
    }
    
    /// Toggles screen color as Off - Red -Yellow - Green - Off
    fileprivate func toggleLight() {
        switch trafficLightState {
        case .lightOff:
            trafficLightState = .lightR
        case .lightR:
            trafficLightState = .lightY
        case .lightY:
            trafficLightState = .lightG
        case .lightG:
            trafficLightState = .lightOff
        }
        
    }
    
    /// Generates haptic feedback
    fileprivate func doHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
