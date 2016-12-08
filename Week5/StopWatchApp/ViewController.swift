//
//  ViewController.swift
//  StopWatchApp
//
//  Created by Viraj Shah on 11/1/16.
//  Copyright © 2016 VetekConsulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBar()
    }

    let inputContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = "00:00:00.00"
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let buttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        return button
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return button
    }()

    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
    }()

    
    lazy var menuLauncher : MenuLauncher = {
        let launcher = MenuLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    
    var timer:Timer? = Timer()
    
    func handleReset(){
        
        timer?.invalidate()
        timer = nil
        
        timeLabel.text = "00:00:00:00"
        
        startTime = Date.timeIntervalSinceReferenceDate

    }

    func handleStart(){
        
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            startTime = Date.timeIntervalSinceReferenceDate

        }
        
        
    }

    
    var isPaused = false
    
    func handlePause(){
        
        
        if isPaused{
            isPaused = false

            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
        }else{
            timer?.invalidate()
            timer = nil

            isPaused = true
        }
        
        
    }

    
    func setupNavBar(){
        navigationItem.title = "Stop Watch"
        
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .red
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(menuTap))
        moreButton.tintColor = .white
        
        navigationItem.rightBarButtonItems =  [moreButton]
    }

    
    func menuTap(){
        menuLauncher.showSettings()
    }
    
    
    var startTime = TimeInterval()
    
    func updateTime() {
        
        var currentTime = Date.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        
        var elapsedTime: TimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let hours = UInt8(elapsedTime / 60.0 / 60.0 )
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= TimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        timeLabel.text = "\(strHours):\(strMinutes):\(strSeconds):\(strFraction)"
        
    }
    
    func setupViews(){
        view.addSubview(inputContainer)
        
        inputContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        inputContainer.addSubview(timeLabel)
        
        timeLabel.leftAnchor.constraint(equalTo: inputContainer.leftAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: inputContainer.topAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: inputContainer.widthAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputContainer.addSubview(buttonContainer)
        
        buttonContainer.leftAnchor.constraint(equalTo: inputContainer.leftAnchor).isActive = true
        buttonContainer.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        buttonContainer.widthAnchor.constraint(equalTo: inputContainer.widthAnchor).isActive = true
        buttonContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonContainer.addSubview(resetButton)
        
        resetButton.leftAnchor.constraint(equalTo: buttonContainer.leftAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 1/3).isActive = true
        resetButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor).isActive = true
        
        buttonContainer.addSubview(pauseButton)
        
        pauseButton.rightAnchor.constraint(equalTo: buttonContainer.rightAnchor).isActive = true
        pauseButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 1/3).isActive = true
        pauseButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor).isActive = true

        buttonContainer.addSubview(startButton)
        
        startButton.leftAnchor.constraint(equalTo: resetButton.rightAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor).isActive = true
        startButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor, multiplier: 1/3).isActive = true
        startButton.heightAnchor.constraint(equalTo: buttonContainer.heightAnchor).isActive = true

        
        
        
    }

}

