//
//  KeyPadView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 15/12/18.
//  Copyright © 2018 LinLiu. All rights reserved.
//

import UIKit

class KeyPadView: UIView {
    var keyPadViewGradientLayer1  = CalculatorGradiantLayer()
    var keyPadViewGradientLayer2  = CalculatorGradiantLayer()
    var keyPadViewGradientLayer3  = CalculatorGradiantLayer()
    
    private var buttonFontSize: CGFloat = 0.0
    
    var button7 = UIButton(), button8 = UIButton(), button9 = UIButton(), buttonPlus = UIButton(), button4 = UIButton(), button5 = UIButton(), button6 = UIButton(), buttonMinus = UIButton(), button1 = UIButton(), button2 = UIButton(), button3 = UIButton(), buttonTime = UIButton(), buttonDot = UIButton(), button0 = UIButton(), buttonNe = UIButton(), buttonDiv = UIButton(), buttonEq = UIButton(), buttonDelete = UIButton(), buttons:[UIButton] = [], numberButtons:[UIButton] = [],operatorButtons:[UIButton] = [], functionButtons:[UIButton] = []
    
    var switchButton = UISwitch()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFrameSize()
        
        self.defineBackgroundColor()
        
        self.setDefautBackgroundColor()
        
        self.addNumberButtons()
        
        self.addOperatorButtons()
        
        self.addFunctionButtons()
        
        self.addSwitchButtons()
        
        self.groupButtons()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func groupButtons(){
        numberButtons = [button7, button8, button9, button4, button5, button6, button1, button2, button3, button0, buttonDot]
        
        operatorButtons = [buttonPlus, buttonMinus, buttonTime, buttonDiv, buttonNe]
        
        functionButtons = [buttonEq, buttonDelete]
    }
    
    
    func setViewFrameSize(){
        self.frame = CGRect(x: 0.0, y: SizeConfig.mainHeight / 10 * 3.3, width: SizeConfig.mainWidth, height: SizeConfig.keyPadHeight)
    }
    
    
    func defineBackgroundColor(){
        keyPadViewGradientLayer1.setLayerProps(parent: self.bounds, leftColor: ColorConfig.keyPadViewBackgroundColorLeft1.cgColor, rightColor: ColorConfig.keyPadViewBackgroundColorRight1.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        keyPadViewGradientLayer2.setLayerProps(parent: self.bounds, leftColor: ColorConfig.keyPadViewBackgroundColorLeft2.cgColor, rightColor: ColorConfig.keyPadViewBackgroundColorRight2.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        keyPadViewGradientLayer3.setLayerProps(parent: self.bounds, leftColor: ColorConfig.keyPadViewBackgroundColorLeft3.cgColor, rightColor: ColorConfig.keyPadViewBackgroundColorRight3.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
    }
    
    
    func setDefautBackgroundColor(){
        self.layer.addSublayer(keyPadViewGradientLayer1)
    }
    
    
    func addNumberButtons(){
        if self.frame.size.height <= 445{
            buttonFontSize = 22
        }else if self.frame.size.height <= 490{
            buttonFontSize = 24
        }else if self.frame.size.height <= 590{
            buttonFontSize = 27
        }else{
            buttonFontSize = 30
        }
        button7 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth,title: "7", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button8 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "8", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button9 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth, title: "9", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button4 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "4", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button5 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "5", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button6 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "6", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button1 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "1", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button2 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "2", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button3 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width:SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "3", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        button0 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "0", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        buttonDot = Buttons(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: ".", fontSize: buttonFontSize, cornerRadius: 0.5  * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
    }
    
    
    func addOperatorButtons(){
        buttonNe = Buttons(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "±", fontSize: buttonFontSize, cornerRadius: 0.5  * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        buttonPlus = Buttons(x: SizeConfig.marginWidth * 19, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth, title: "+", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.mainViewBackgroundColorRight1, titleColor: UIColor.black, manager: self)
        
        buttonMinus = Buttons(x: SizeConfig.marginWidth * 19, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth, title: "−", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.mainViewBackgroundColorRight1, titleColor: UIColor.black, manager: self)
        
        buttonTime = Buttons(x: SizeConfig.marginWidth * 19, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth, title: "×", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.mainViewBackgroundColorRight1, titleColor: UIColor.black, manager: self)
        
        buttonDiv = Buttons(x: SizeConfig.marginWidth * 19, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth, title: "÷", fontSize: buttonFontSize, cornerRadius: 0.5  * SizeConfig.buttonWidth, backgroundColor: ColorConfig.mainViewBackgroundColorRight1, titleColor: UIColor.black, manager: self)
    }
    
    
    func addFunctionButtons(){
        buttonDelete = Buttons(x: SizeConfig.marginWidth * 19, y: SizeConfig.marginHeight * 5 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth * 0.9, title: "←", fontSize: buttonFontSize, cornerRadius: 10, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
        
        buttonEq = Buttons(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 5 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth * 4, height:  SizeConfig.buttonWidth * 0.9, title: "=", fontSize: buttonFontSize, cornerRadius: 10, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1 , titleColor: UIColor.black, manager: self)
    }
    
    
    func addSwitchButtons(){
        print(self.frame.size.height)
        if self.frame.size.height <= 381{
            switchButton = UISwitch(frame: CGRect(x: SizeConfig.marginWidth * 1.0, y: SizeConfig.marginWidth * 1.4, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth * 0.9))
            switchButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }else if self.frame.size.height <= 450{
            switchButton = UISwitch(frame: CGRect(x: SizeConfig.marginWidth * 1.4, y: SizeConfig.marginWidth * 1.8, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth * 0.9))
            switchButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.35)
        }else if self.frame.size.height <= 550{
            switchButton = UISwitch(frame: CGRect(x: SizeConfig.marginWidth * 1.43, y: SizeConfig.marginWidth * 1.8, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth * 0.9))
            switchButton.transform = CGAffineTransform(scaleX: 1.30, y: 1.35)
        }
        else{
            switchButton = UISwitch(frame: CGRect(x: SizeConfig.marginWidth * 1.5, y: SizeConfig.marginWidth * 1.8, width: SizeConfig.buttonWidth, height: SizeConfig.buttonWidth * 0.9))
            switchButton.transform = CGAffineTransform(scaleX: 1.45, y: 1.5)
        }
        
        switchButton.onTintColor = ColorConfig.mainViewBackgroundColorLeft1
        self.addSubview(switchButton)
    }
    
}

