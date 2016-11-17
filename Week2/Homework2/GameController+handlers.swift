//
//  GameController+handlers.swift
//  Homework2
//
//  Created by Viraj Shah on 9/14/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit


extension GameViewController{
    
    func handleRange(){
        view.addSubview(rangePicker)
        
        rangePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rangePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rangePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rangePicker.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    func compareGuess(){
        
        if guess == x{
            print("Success")
            displayMyAlertMessage("Congratulations", userMessage: "You guessed the right number! Start a New Game?")
        }
        
        if guess < x{
            textDescription.text = "Your guess is too small"
        }
        if guess > x{
            textDescription.text = "Your guess is too large"

        }
        
    }
    
    
    func reset(){
        rangeTextField.text = ""
        guessTextField.text = ""
        counter = 0
        enterText.text = "You tried \(counter) times"
        textDescription.text = ""
        enterButton.isEnabled = false
        guessTextField.isEnabled = false
    }
    
    func resetGame(_ alert:UIAlertAction!){
        reset()
    }
    
    func dismissView(_ alert:UIAlertAction!){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func displayMyAlertMessage(_ title:String,userMessage:String){
        
        
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: resetGame)
        myAlert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: dismissView)
        myAlert.addAction(cancelAction)

        
        self.present(myAlert, animated: true, completion: nil)
    }

    
    func enterButtonTapped(){
        
        textContainer.alpha = 1

        if checkguess() == true {
            counter += 1
            enterText.text = "You tried \(counter) times"
            textDescription.text = ""
            let a:Int? = Int(guessTextField.text!)
            guess = a!
            print(guess)
            print(x)
            compareGuess()
        }
        
    }
    

    
    
    func checkguess()-> Bool{
        if guessTextField.text?.isEmpty == true{
            textDescription.text = "Enter a number"
            return false
        }

        
        return true
    }
    
    func donePicker(){
        rangeTextField.resignFirstResponder()
        guessTextField.resignFirstResponder()
        enterButton.isEnabled = true
        
    }
    
    
    func setupViews(){
        startGameView()
        
    }
    
    func startGameView(){
        view.addSubview(inputsContainer)
        view.addSubview(textContainer)

        inputsContainer.addSubview(selectRangeContainer)
        inputsContainer.addSubview(guessContainer)
        inputsContainer.addSubview(enterContainer)
        
        
        selectRangeContainer.addSubview(rangeText)
        selectRangeContainer.addSubview(rangeTextField)
        rangeTextField.addSubview(downIndicator)
        
        
        guessContainer.addSubview(guessText)
        guessContainer.addSubview(guessTextField)
        
        enterContainer.addSubview(enterText)
        enterContainer.addSubview(enterButton)
        
        
        textContainer.addSubview(textDescription)
        
        
        inputsContainer.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        inputsContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        inputsContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        inputsContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        selectRangeContainer.topAnchor.constraint(equalTo: inputsContainer.topAnchor).isActive = true
        selectRangeContainer.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        selectRangeContainer.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        selectRangeContainer.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/3).isActive = true
        
        rangeText.leftAnchor.constraint(equalTo: selectRangeContainer.leftAnchor, constant: 30).isActive = true
        rangeText.centerYAnchor.constraint(equalTo: selectRangeContainer.centerYAnchor).isActive = true
        rangeText.widthAnchor.constraint(equalTo: selectRangeContainer.widthAnchor, multiplier: 0.6).isActive = true
        rangeText.heightAnchor.constraint(equalTo: selectRangeContainer.heightAnchor).isActive = true
        
        rangeTextField.rightAnchor.constraint(equalTo: selectRangeContainer.rightAnchor, constant: -20).isActive = true
        rangeTextField.centerYAnchor.constraint(equalTo: rangeText.centerYAnchor).isActive = true
        rangeTextField.widthAnchor.constraint(equalTo: selectRangeContainer.widthAnchor, multiplier: 0.30).isActive = true
        rangeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        downIndicator.centerYAnchor.constraint(equalTo: rangeTextField.centerYAnchor).isActive = true
        downIndicator.rightAnchor.constraint(equalTo: rangeTextField.rightAnchor, constant: -4).isActive = true
        downIndicator.widthAnchor.constraint(equalToConstant: 20).isActive = true
        downIndicator.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        guessContainer.topAnchor.constraint(equalTo: selectRangeContainer.bottomAnchor).isActive = true
        guessContainer.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        guessContainer.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        guessContainer.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/3).isActive = true
        
        
        guessText.leftAnchor.constraint(equalTo: guessContainer.leftAnchor, constant: 30).isActive = true
        guessText.centerYAnchor.constraint(equalTo: guessContainer.centerYAnchor).isActive = true
        guessText.widthAnchor.constraint(equalTo: guessContainer.widthAnchor, multiplier: 0.6).isActive = true
        guessText.heightAnchor.constraint(equalTo: guessContainer.heightAnchor).isActive = true
        
        guessTextField.rightAnchor.constraint(equalTo: guessContainer.rightAnchor, constant: -20).isActive = true
        guessTextField.centerYAnchor.constraint(equalTo: guessText.centerYAnchor).isActive = true
        guessTextField.widthAnchor.constraint(equalTo: guessContainer.widthAnchor, multiplier: 0.3).isActive = true
        guessTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        enterContainer.topAnchor.constraint(equalTo: guessContainer.bottomAnchor).isActive = true
        enterContainer.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        enterContainer.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        enterContainer.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/3).isActive = true
        
        
        enterText.leftAnchor.constraint(equalTo: enterContainer.leftAnchor, constant: 30).isActive = true
        enterText.centerYAnchor.constraint(equalTo: enterContainer.centerYAnchor).isActive = true
        enterText.widthAnchor.constraint(equalTo: enterContainer.widthAnchor, multiplier: 0.6).isActive = true
        enterText.heightAnchor.constraint(equalTo: enterContainer.heightAnchor).isActive = true
        
        enterButton.centerYAnchor.constraint(equalTo: enterText.centerYAnchor).isActive = true
        enterButton.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor, constant: -20).isActive = true
        enterButton.widthAnchor.constraint(equalTo: guessContainer.widthAnchor, multiplier: 0.3).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textContainer.topAnchor.constraint(equalTo: inputsContainer.bottomAnchor).isActive = true
        textContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textContainer.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        textContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        textDescription.centerXAnchor.constraint(equalTo: textContainer.centerXAnchor).isActive = true
        textDescription.centerYAnchor.constraint(equalTo: textContainer.centerYAnchor).isActive = true
        textDescription.widthAnchor.constraint(equalTo: textContainer.widthAnchor , multiplier: 0.8).isActive = true
        textDescription.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
    func setupNavBarAttributes(){
        navigationItem.title = "Guess the Number"
        
        let addButton = UIBarButtonItem(image: UIImage(named: "Bars"), style: .plain, target: self, action: #selector(menuTapped))
        addButton.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem = addButton
        
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 24)!, NSForegroundColorAttributeName : UIColor.darkGray]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    
    func showMenu(){
        view.addSubview(menuPicker)
        
        menuPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuPicker.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuPicker.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuPicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        

        
    }
    
    
    func menuTapped(){
        showMenu()
    }
    
    
}
