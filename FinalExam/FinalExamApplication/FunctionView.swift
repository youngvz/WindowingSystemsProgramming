//
//  ViewController.swift
//  FinalExamApplication
//
//  Created by Viraj Shah on 11/17/16.
//  Copyright © 2016 VetekConsutling. All rights reserved.
//

import UIKit

class FunctionController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        setupNavBar()
        setupViews()
        
    }

    let inputContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let xLabel: UILabel = {
        let label = UILabel()
        label.text = "X ="
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let yLabel: UILabel = {
        let label = UILabel()
        label.text = "Y ="
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let functionLabel: UILabel = {
        let label = UILabel()
        label.text = "F(X,Y)"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let computeLabel: UILabel = {
        let label = UILabel()
        label.text = "F(X,Y) ="
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let xTextField: UITextField = {
        let tf = UITextField()
        tf.text = "1"
        let paddingForFirst = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.size.height-5))
        
        tf.leftView = paddingForFirst
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    let yTextField: UITextField = {
        let tf = UITextField()
        tf.text = "1"
        let paddingForFirst = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.size.height-5))
        
        tf.leftView = paddingForFirst
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var functionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.isUserInteractionEnabled = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    lazy var functionContainerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFunction)))
        return label
    }()

    let computeTextField: UITextField = {
        let tf = UITextField()
        tf.text = ""
        let paddingForFirst = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.size.height-5))
        
        tf.leftView = paddingForFirst
        tf.leftViewMode = .always
        tf.textAlignment = .center
        tf.isEnabled = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var computeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Compute", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        
        btn.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    lazy var menuLauncher: MenuLauncher = {
        let launcher = MenuLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    lazy var functionLauncher: FunctionLauncher = {
        let launcher = FunctionLauncher()
        launcher.viewcontroller = self
        return launcher
    }()

    func setupViews(){
        view.addSubview(inputContainer)
        inputContainer.addSubview(xLabel)
        inputContainer.addSubview(xTextField)
        inputContainer.addSubview(yLabel)
        inputContainer.addSubview(yTextField)
        inputContainer.addSubview(functionLabel)
        inputContainer.addSubview(functionContainer)
        functionContainer.addSubview(functionContainerLabel)
        inputContainer.addSubview(computeLabel)
        inputContainer.addSubview(computeTextField)
        inputContainer.addSubview(computeButton)
        
        inputContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainer.widthAnchor.constraint(equalToConstant: 300).isActive = true
        inputContainer.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        xLabel.topAnchor.constraint(equalTo: inputContainer.topAnchor, constant: 2).isActive = true
        xLabel.leftAnchor.constraint(equalTo: inputContainer.leftAnchor, constant: 12).isActive = true
        xLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        xLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        xTextField.centerYAnchor.constraint(equalTo: xLabel.centerYAnchor).isActive = true
        xTextField.leftAnchor.constraint(equalTo: xLabel.rightAnchor, constant: 6).isActive = true
        xTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        xTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        yLabel.topAnchor.constraint(equalTo: xLabel.bottomAnchor, constant: 2).isActive = true
        yLabel.leftAnchor.constraint(equalTo: inputContainer.leftAnchor, constant: 12).isActive = true
        yLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        yLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        yTextField.centerYAnchor.constraint(equalTo: yLabel.centerYAnchor).isActive = true
        yTextField.leftAnchor.constraint(equalTo: yLabel.rightAnchor, constant: 6).isActive = true
        yTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        yTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        functionLabel.topAnchor.constraint(equalTo: yLabel.bottomAnchor, constant: 2).isActive = true
        functionLabel.leftAnchor.constraint(equalTo: inputContainer.leftAnchor, constant: 12).isActive = true
        functionLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true

        functionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        functionContainer.centerYAnchor.constraint(equalTo: functionLabel.centerYAnchor).isActive = true
        functionContainer.leftAnchor.constraint(equalTo: functionLabel.rightAnchor, constant: 6).isActive = true
        functionContainer.widthAnchor.constraint(equalToConstant: 200).isActive = true
        functionContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true

        functionContainerLabel.centerXAnchor.constraint(equalTo: functionContainer.centerXAnchor).isActive = true
        functionContainerLabel.centerYAnchor.constraint(equalTo: functionContainer.centerYAnchor).isActive = true
        functionContainerLabel.widthAnchor.constraint(equalTo: functionContainer.widthAnchor, constant: -12).isActive = true
        functionContainerLabel.heightAnchor.constraint(equalTo: functionContainer.heightAnchor).isActive = true
        
        computeLabel.topAnchor.constraint(equalTo: functionLabel.bottomAnchor, constant: 2).isActive = true
        computeLabel.leftAnchor.constraint(equalTo: inputContainer.leftAnchor, constant: 12).isActive = true
        computeLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        computeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        computeTextField.centerYAnchor.constraint(equalTo: computeLabel.centerYAnchor).isActive = true
        computeTextField.leftAnchor.constraint(equalTo: computeLabel.rightAnchor, constant: 6).isActive = true
        computeTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        computeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        computeButton.bottomAnchor.constraint(equalTo: inputContainer.bottomAnchor, constant: 2).isActive = true
        computeButton.leftAnchor.constraint(equalTo: inputContainer.leftAnchor).isActive = true
        computeButton.widthAnchor.constraint(equalTo: inputContainer.widthAnchor).isActive = true
        computeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}

