//
//  ViewController.swift
//  Homework 4
//
//  Created by Viraj Shah on 10/11/16.
//  Copyright © 2016 WSP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAttributes()
        setupViews()
    
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        strokeThicknessTextField.keyboardType = UIKeyboardType.numberPad
        strokeThicknessTextField.inputAccessoryView = toolBar

    }
    
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
    
    
    func donePicker(){
        strokeThicknessTextField.resignFirstResponder()
    }
    
    lazy var toolBar: UIToolbar = {
        let tb = UIToolbar()
        tb.barStyle = UIBarStyle.default
        tb.isTranslucent = true
        tb.tintColor = UIColor.gray
        tb.sizeToFit()
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        return tb
    }()
    
    let menuContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shapeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shape"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
//    lazy var shapeLabelText: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Rectangle"
//        label.textAlignment = .center
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.setValue(1, animated: true)
        return slider
    }()
    
    
//    lazy var shapeLabelTextContainer: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 1
//        view.backgroundColor = .red
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShape)))
//        return view
//    }()
    
    
    
    
    func handleShape(){
        shapeLauncher.showSettings()
    }
    
    let fillColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fill Color"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var fillColorTextContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFillColor)))
        return view
    }()
    
    lazy var fillColorLauncher: FillColorLauncher = {
        let launcher = FillColorLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    func handleFillColor(){
        fillColorLauncher.showSettings()
    }
    
    
    lazy var fillColorLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let strokeThicknessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stroke Thickness"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var strokeThicknessLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var strokeThicknessTextContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFillColor)))
        return view
    }()
    
    lazy var strokeThicknessTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        tf.text = "1"
        tf.layer.borderWidth = 1
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    lazy var strokeColorLauncher: StrokeColorLauncher = {
        let launcher = StrokeColorLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    func handleStrokeColor(){
        strokeColorLauncher.showSettings()
    }
    
    let strokeColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stroke Color"
        label.font = UIFont.systemFont(ofSize: 20)

        label.textColor = .black

        return label
    }()
    
    lazy var strokeColorTextContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleStrokeColor)))
        return view
    }()
    
    lazy var strokeColorLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Black"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    
    let shapeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let shapeFilterContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if (touch.view == shapeFilterContainer){
            
            
            //let position :CGPoint = touch.location(in: shapeFilterContainer)
                
                
            let location = (touch).location(in: self.shapeFilterContainer)
                
                let sliderValue = CGFloat(10)
                
                let circle = UIView(frame: CGRect(x: location.x, y: location.y, width: sliderValue, height: sliderValue))
                
                
                circle.layer.cornerRadius = sliderValue/2
                circle.backgroundColor = .systemColor(fillColorLabelText.text!)
                circle.layer.borderColor = UIColor.systemColor(strokeColorLabelText.text!).cgColor
                circle.layer.borderWidth = CGFloat(convertString())
                self.shapeFilterContainer.addSubview(circle)
                
                animateShape(view: circle)
            

            }

            
        }
    }

    func animateShape(view: UIView){
        
        
    
        UIView.animate(withDuration: 1, animations: { () -> Void in
            view.transform = CGAffineTransform(scaleX: CGFloat(self.slider.value), y: CGFloat(self.slider.value))
        }) { (finished: Bool) -> Void in
//            UIView.animate(withDuration: 1, animations: { () -> Void in
//                view.transform = CGAffineTransform.identity
//            })
            UIView.animate(withDuration: 1, animations: { 
                view.transform = CGAffineTransform.identity
            }, completion: { (Bool) in
                self.resetGame()
            })
        
        }
        


        
        
    }
    
    func convertString() -> Int {
        
        let converted: Int = Int(strokeThicknessTextField.text!)!
        
        return converted
    }
    
    func setupViews(){
        
        view.addSubview(menuContainer)
        menuContainer.addSubview(shapeLabel)
        menuContainer.addSubview(slider)
        //menuContainer.addSubview(shapeLabelTextContainer)
        //shapeLabelTextContainer.addSubview(shapeLabelText)
        
        menuContainer.addSubview(fillColorLabel)
        menuContainer.addSubview(fillColorTextContainer)
        
        fillColorTextContainer.addSubview(fillColorLabelText)
        
        menuContainer.addSubview(strokeThicknessLabel)
        menuContainer.addSubview(strokeThicknessTextField)
        
        //strokeThicknessTextContainer.addSubview(strokeThicknessLabelText)
        
        menuContainer.addSubview(strokeColorLabel)
        menuContainer.addSubview(strokeColorTextContainer)
        
        strokeColorTextContainer.addSubview(strokeColorLabelText)
        
        
        view.addSubview(shapeContainer)
        shapeContainer.addSubview(shapeFilterContainer)
        
        menuContainer.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuContainer.heightAnchor.constraint(equalToConstant: 124).isActive = true
        
        
        
        shapeLabel.topAnchor.constraint(equalTo: menuContainer.topAnchor, constant: 12).isActive = true
        shapeLabel.leftAnchor.constraint(equalTo: menuContainer.leftAnchor, constant: 6).isActive = true
        shapeLabel.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.5).isActive = true
        shapeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        slider.topAnchor.constraint(equalTo: menuContainer.topAnchor, constant: 12).isActive = true
        slider.leftAnchor.constraint(equalTo: shapeLabel.rightAnchor, constant: 6).isActive = true
        slider.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.4).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
//        
//        shapeLabelText.centerXAnchor.constraint(equalTo: shapeLabelTextContainer.centerXAnchor).isActive = true
//        shapeLabelText.centerYAnchor.constraint(equalTo: shapeLabelTextContainer.centerYAnchor).isActive = true
//        shapeLabelText.widthAnchor.constraint(equalTo: shapeLabelTextContainer.widthAnchor).isActive = true
//        shapeLabelText.heightAnchor.constraint(equalTo: shapeLabelTextContainer.heightAnchor).isActive = true
        
        fillColorLabel.topAnchor.constraint(equalTo: shapeLabel.bottomAnchor).isActive = true
        fillColorLabel.leftAnchor.constraint(equalTo: shapeLabel.leftAnchor).isActive = true
        fillColorLabel.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.5).isActive = true
        fillColorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        fillColorTextContainer.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 4).isActive = true
        fillColorTextContainer.leftAnchor.constraint(equalTo: fillColorLabel.rightAnchor, constant: 6).isActive = true
        fillColorTextContainer.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.4).isActive = true
        fillColorTextContainer.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        fillColorLabelText.centerXAnchor.constraint(equalTo: fillColorTextContainer.centerXAnchor).isActive = true
        fillColorLabelText.centerYAnchor.constraint(equalTo: fillColorTextContainer.centerYAnchor).isActive = true
        fillColorLabelText.widthAnchor.constraint(equalTo: fillColorTextContainer.widthAnchor).isActive = true
        fillColorLabelText.heightAnchor.constraint(equalTo: fillColorTextContainer.heightAnchor).isActive = true
        
        
        strokeThicknessLabel.topAnchor.constraint(equalTo: fillColorLabel.bottomAnchor).isActive = true
        strokeThicknessLabel.leftAnchor.constraint(equalTo: shapeLabel.leftAnchor).isActive = true
        strokeThicknessLabel.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.5).isActive = true
        strokeThicknessLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        strokeThicknessTextField.topAnchor.constraint(equalTo: fillColorTextContainer.bottomAnchor).isActive = true
        strokeThicknessTextField.leftAnchor.constraint(equalTo: strokeThicknessLabel.rightAnchor, constant: 6).isActive = true
        strokeThicknessTextField.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.4).isActive = true
        strokeThicknessTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
//        strokeThicknessLabelText.centerXAnchor.constraint(equalTo: strokeThicknessTextContainer.centerXAnchor).isActive = true
//        strokeThicknessLabelText.centerYAnchor.constraint(equalTo: strokeThicknessTextContainer.centerYAnchor).isActive = true
//        strokeThicknessLabelText.widthAnchor.constraint(equalTo: strokeThicknessTextContainer.widthAnchor).isActive = true
//        strokeThicknessLabelText.heightAnchor.constraint(equalTo: strokeThicknessTextContainer.heightAnchor).isActive = true
        
        
        strokeColorLabel.topAnchor.constraint(equalTo: strokeThicknessLabel.bottomAnchor).isActive = true
        strokeColorLabel.leftAnchor.constraint(equalTo: shapeLabel.leftAnchor).isActive = true
        strokeColorLabel.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.5).isActive = true
        strokeColorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        strokeColorTextContainer.topAnchor.constraint(equalTo: strokeThicknessTextField.bottomAnchor).isActive = true
        strokeColorTextContainer.leftAnchor.constraint(equalTo: strokeColorLabel.rightAnchor, constant: 6).isActive = true
        strokeColorTextContainer.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.4).isActive = true
        strokeColorTextContainer.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        strokeColorLabelText.centerXAnchor.constraint(equalTo: strokeColorTextContainer.centerXAnchor).isActive = true
        strokeColorLabelText.centerYAnchor.constraint(equalTo: strokeColorTextContainer.centerYAnchor).isActive = true
        strokeColorLabelText.widthAnchor.constraint(equalTo: strokeColorTextContainer.widthAnchor).isActive = true
        strokeColorLabelText.heightAnchor.constraint(equalTo: strokeColorTextContainer.heightAnchor).isActive = true
        
        
        shapeContainer.topAnchor.constraint(equalTo: menuContainer.bottomAnchor).isActive = true
        shapeContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        shapeContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        shapeContainer.heightAnchor.constraint(equalToConstant: view.frame.height - 125).isActive = true
        
        shapeFilterContainer.topAnchor.constraint(equalTo: shapeContainer.topAnchor).isActive = true
        shapeFilterContainer.leftAnchor.constraint(equalTo: shapeContainer.leftAnchor).isActive = true
        shapeFilterContainer.widthAnchor.constraint(equalTo: shapeContainer.widthAnchor).isActive = true
        shapeFilterContainer.heightAnchor.constraint(equalTo: shapeContainer.heightAnchor).isActive = true
        
    }
    
    
    func setupNavBarAttributes(){
        navigationItem.title = "Simple Drawing App"
        
        let addButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(menuTapped))
        addButton.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem = addButton
        
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 24)!, NSForegroundColorAttributeName : UIColor.darkGray]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    
    lazy var menuLauncher: MenuLauncher = {
        let launcher = MenuLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    
    lazy var shapeLauncher: ShapeLauncher = {
        let launcher = ShapeLauncher()
        launcher.viewcontroller = self
        return launcher
    }()
    
    func resetGame(){
        for view in shapeFilterContainer.subviews{
            view.removeFromSuperview()
        }
        
        self.shapeFilterContainer.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        menuLauncher.handleDismiss()
    }
    
    func menuTapped(){
        
        menuLauncher.showSettings()

    }


}

