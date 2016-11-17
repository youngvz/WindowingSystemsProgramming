//
//  ViewController.swift
//  Homework2
//
//  Created by Viraj Shah on 9/13/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let inputsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selectRangeContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let rangeText: UILabel = {
       let label = UILabel()
        label.text = "Select the range from 0 to"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    let downIndicator: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Down")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    lazy var rangeTextField : UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRange)))
        tf.layer.borderWidth = 1
        tf.textAlignment = .center
        tf.endFloatingCursor()
        return tf
    }()
    
    let guessContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let guessText: UILabel = {
        let label = UILabel()
        label.text = "Enter your guess here"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var guessTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        tf.layer.borderWidth = 1
        tf.isEnabled = false
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    let enterContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var counter = 0
    var x = Int()
    var guess = Int()
    
    let enterText: UILabel = {
        let label = UILabel()
        label.text = "You tried 0 times"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var enterButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = false
        btn.setTitle("Enter", for: UIControlState())
        btn.setTitleColor(UIColor.black, for: UIControlState())
        btn.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }()
    
    let textContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alpha = 0
        return container
    }()
    
    let textDescription: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var rangePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.showsSelectionIndicator = true
        return picker
    }()
    
    let rangePickerData = ["10", "100", "1000"]
    
    lazy var menuPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.showsSelectionIndicator = true
        return picker
    }()
    
    let menuPickerData = ["New Game", "Exit"]
    
    lazy var doneButton: UIBarButtonItem = {
       var btn = UIBarButtonItem()
        btn = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        
        return btn
    }()
    
     let spaceButton: UIBarButtonItem = {
        var btn = UIBarButtonItem()
        btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)

        return btn
    }()
    
    lazy var cancelButton: UIBarButtonItem = {
        var btn = UIBarButtonItem()
        btn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        return btn
    }()
    
    lazy var toolBar: UIToolbar = {
        let tb = UIToolbar()
        tb.barStyle = UIBarStyle.default
        tb.isTranslucent = true
        tb.tintColor = UIColor.gray
        tb.sizeToFit()
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        return tb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        rangeTextField.inputView = rangePicker
        rangeTextField.inputAccessoryView = toolBar
        
        guessTextField.keyboardType = UIKeyboardType.numberPad
        guessTextField.inputAccessoryView = toolBar
        
        menuPicker.inputAccessoryView
        
        setupNavBarAttributes()
        setupViews()
        view.backgroundColor = UIColor.white
    }


}
