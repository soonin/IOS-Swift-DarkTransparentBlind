//
//  Extentions.swift
//  IOS-Swift-DarkTransparentBlind
//
//  Created by Pooya on 2018-06-07.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class handleHelper: NSObject {
    
    let blackView = UIView()

    func handleTransBlind(hexColor : String = "000000", alpha: CGFloat = 0.5, myDuration: Double = 0.5) {
        
        if let window = UIApplication.shared.keyWindow {
            // show Blind
            blackView.backgroundColor = UIColor(hex: hexColor, alpha: alpha)
        
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handelDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: myDuration) {
                self.blackView.alpha = 1
            }
            
            print("Blind Shown")
            
            
        } else {
            print("Window error!")
        }
    }
    
    @objc func handelDismiss()  {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    

}


extension UIColor {
    
   convenience init(hex : String , alpha: CGFloat = 1.0) {
        let index0 = hex.index(hex.startIndex, offsetBy: 0)
        let index1 = hex.index(hex.startIndex, offsetBy: 1)
        let index2 = hex.index(hex.startIndex, offsetBy: 2)
        let index3 = hex.index(hex.startIndex, offsetBy: 3)
        let index4 = hex.index(hex.startIndex, offsetBy: 4)
        let index5 = hex.index(hex.startIndex, offsetBy: 5)

        let redHexStr = String(hex[index0...index1]) // "12"
        let greedHexStr = String(hex[index2...index3]) // "34"
        let blueHexStr = String(hex[index4...index5]) // "56"
    
        let red = UInt8(redHexStr, radix: 16)
        let green = UInt8(greedHexStr, radix: 16)
        let blue = UInt8(blueHexStr, radix: 16)
        
        self.init(
        red: CGFloat(red!) / 255.0,
        green: CGFloat(green!) / 255.0,
        blue: CGFloat(blue!) / 255.0,
        alpha : alpha
            )
        }
}
