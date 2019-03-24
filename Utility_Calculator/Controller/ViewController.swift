//
//  ViewController.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 15/12/18.
//  Copyright © 2018 LinLiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var keyPadView = KeyPadView()
    var mainView = MainView()
    var sideDrawerView = SideDrawerView()
    var color = ColorConfig()
    var userClickedDotButton = false
    var mOperand = 0.0
    var mSecondOperand = 0.0
    var mOperator: String?
    var userClickedUnaryOperator = false
    var displayValue: String?
    var displayValueForResult: String?
    
    private var model = CalculationModel()
    
    
    override func loadView() {
        view = mainView
        view.addSubview(keyPadView)
        view.addSubview(sideDrawerView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in keyPadView.numberButtons{
            if item.currentTitle != nil{
                item.addTarget(self, action: #selector(onClickButtonsGetOperand), for: .touchUpInside)
            }
        }
        
        for item in keyPadView.operatorButtons{
            if item.currentTitle != nil {
                item.addTarget(self, action: #selector(onClickButtonsGetOperator), for: .touchUpInside)
            }
        }
        
        for item in sideDrawerView.unaryButtons{
            if item.currentTitle != nil {
                item.addTarget(self, action: #selector(onClickButtonsGetOperator), for: .touchUpInside)
            }
        }
        
        for item in keyPadView.functionButtons{
            if item.currentTitle != nil {
                item.addTarget(self, action: #selector(onClickFunctionButtons), for: .touchUpInside)
            }
        }
        
        for item in sideDrawerView.colorButtons{
            if item.currentTitle != nil {
                item.addTarget(self, action: #selector(onClickColorButtons), for: .touchUpInside)
            }
        }
        
        keyPadView.switchButton.addTarget(self, action: #selector(ViewController.switchStateDidChange), for: .valueChanged)
        
    }
    
    
    @objc func onClickButtonsGetOperand(sender: UIButton){
        if mOperator == "√" || mOperator == "±" {
            return;
        }
        
        let digit = sender.currentTitle!
        if digit.isEmpty { return }
        
        if let textCurrentlyInDisplay = mainView.processLabel.text{
            let textCurrentlyInDisplay2 = textCurrentlyInDisplay + digit
            mainView.processLabel.text = textCurrentlyInDisplay2
            if let displayValue = Double(mainView.processLabel.text!){
                mOperand = displayValue
                model.setFirstOperand(mOperand)
            }
        }
        
        if mOperator != nil && mainView.processLabel.text != String(mOperand) + mOperator!{
            if let textCurrentlyInDisplay = mainView.pendingLabel.text{
                mainView.pendingLabel.text = textCurrentlyInDisplay + digit
                mSecondOperand = Double(mainView.pendingLabel.text!)!
                model.setSecondOperand(mSecondOperand)
                model.performOperation()
            }
        }
        
        
        if Double(mainView.processLabel.text!) != mOperand {
            displayValue = "(" + mainView.processLabel.text! + ")"
            displayValueForResult = mainView.processLabel.text!
        }else{
            displayValue = mainView.processLabel.text!
            displayValueForResult = mainView.processLabel.text!
        }
        
        if sender.currentTitle == keyPadView.buttonDot.currentTitle {
            keyPadView.buttonDot.isUserInteractionEnabled = false
        }
        
    }
    
    
    @objc func onClickButtonsGetOperator(sender: UIButton){
        mOperator = sender.currentTitle
        mainView.pendingLabel.text = "0"
        
        if displayValue != nil {
            
            keyPadView.buttonDot.isUserInteractionEnabled = true
            
            if Double(mainView.resultLabel.text!) == model.unaryReslut && userClickedUnaryOperator == true{
                mainView.processLabel.text = displayValue! + mOperator!
            }else{
                mainView.processLabel.text = displayValue! + mOperator!
            }
            
            if mOperator != keyPadView.buttonPlus.currentTitle && mOperator !=  keyPadView.buttonMinus.currentTitle && mOperator !=  keyPadView.buttonTime.currentTitle && mOperator !=  keyPadView.buttonDiv.currentTitle  {
                return;
            }
            
            model.setOperatorAndSaveFirstOperand(mOperator!)
            
        }else{
            mOperator = nil
        }
    }
    
    
    @objc func onClickFunctionButtons(sender: UIButton){
        if sender.currentTitle == keyPadView.buttonDelete.currentTitle{
            initialiser()
        }
        else if sender.currentTitle == keyPadView.buttonEq.currentTitle && mainView.processLabel.text != keyPadView.buttonDot.currentTitle{
            
            if let result = model.result, mOperator == keyPadView.buttonPlus.currentTitle || mOperator == keyPadView.buttonMinus.currentTitle || mOperator == keyPadView.buttonTime.currentTitle || mOperator == keyPadView.buttonDiv.currentTitle {
                if let newDisplayValue = displayValueForResult{
                    mainView.processLabel.text = newDisplayValue
                    mainView.resultLabel.text = String(result)
                }
            }
            
            if mOperator != keyPadView.buttonPlus.currentTitle && mOperator !=  keyPadView.buttonMinus.currentTitle && mOperator !=  keyPadView.buttonTime.currentTitle && mOperator !=  keyPadView.buttonDiv.currentTitle && mOperator != nil {
                userClickedUnaryOperator = true
                model.setOperatorAndSaveFirstOperand(mOperator!)
                displayValue = "(" + mainView.processLabel.text! + ")"
                if let result = model.unaryReslut{
                    mainView.processLabel.text = displayValue!
                    mainView.resultLabel.text = String(result)
                }
            }
        }
    }
    
    
    func initialiser() {
        mainView.processLabel.text = ""
        mainView.resultLabel.text = "0"
        mainView.pendingLabel.text = "0"
        mOperand = 0.0
        mOperator = nil
        displayValue = nil
        displayValueForResult = nil
        keyPadView.buttonDot.isUserInteractionEnabled = true
    }
    
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        if sender.isOn == true{
            UIView.animate(withDuration: 0.4, animations: {
                self.sideDrawerView.transform = self.sideDrawerView.transform.translatedBy(x:+(SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth) , y: 0.0)
            })
        }
        else{
            UIView.animate(withDuration: 0.4, animations: {
                self.sideDrawerView.transform = self.sideDrawerView.transform.translatedBy(x:-(SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth) , y: 0.0)
            })
        }
    }
    
    
    @objc func  onClickColorButtons(sender: UIButton){
        if sender.tag == 1{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer1, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer1, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor1
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight1
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor1
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft1
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft1
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor1
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor1
        }
        else if sender.tag == 2{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer2, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer2, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor2
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight2
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor2
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft2
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft2
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor2
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor2
        }
        else if sender.tag == 3{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer3, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer3, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor3
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.keyPadViewOperatorButtonColor3
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor3
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft3
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft3
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor3

            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor3
     
        }
        else if sender.tag == 4{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer4, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer4, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor4
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight4
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor4
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft4
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft4
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor4
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor4
        }
        else if sender.tag == 5{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer5, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer5, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor5
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight5
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor5
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft5
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft5
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor5
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor5
        }
        else if sender.tag == 6{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer6, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer6, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor6
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight6
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor6
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft6
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft6
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor6
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor6
        }
        else if sender.tag == 7{
            mainView.layer.sublayers?[0].removeFromSuperlayer()
            mainView.layer.insertSublayer(mainView.mainViewGradientLayer7, at: 0)
            mainView.setNeedsDisplay()
            
            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer7, at: 0)
            keyPadView.setNeedsDisplay()
            
            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor7
            
            for item in keyPadView.operatorButtons{
                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight7
            }
            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor7
            
            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft7
            
            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft7
            
            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor7
            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor7
        }
//        else if sender.tag == 8{
//            mainView.layer.sublayers?[0].removeFromSuperlayer()
//            mainView.layer.insertSublayer(mainView.mainViewGradientLayer8, at: 0)
//            mainView.setNeedsDisplay()
//            
//            keyPadView.layer.sublayers?[0].removeFromSuperlayer()
//            keyPadView.layer.insertSublayer(keyPadView.keyPadViewGradientLayer8, at: 0)
//            keyPadView.setNeedsDisplay()
//            
//            mainView.processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor8
//            
//            for item in keyPadView.operatorButtons{
//                item.backgroundColor = ColorConfig.mainViewBackgroundColorRight8
//            }
//            keyPadView.buttonNe.backgroundColor = ColorConfig.keyPadViewNumberButtonBackgroundColor8
//            
//            sideDrawerView.backgroundColor = ColorConfig.mainViewBackgroundColorLeft8
//            
//            keyPadView.switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft8
//            
//            mainView.processLabel.textColor = ColorConfig.mainViewProcessLabelTextColor8
//            mainView.resultLabel.textColor = ColorConfig.mainViewResultLabelTextColor8
//        }
    }
    
}

