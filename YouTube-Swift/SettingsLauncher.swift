//
//  SettingsLauncher.swift
//  YouTube-Swift
//
//  Created by Nguyen, Jason on 11/25/16.
//  Copyright © 2016 Jason Nguyen. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject{
    
    let blackView = UIView()
    
    func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
        
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
    
    func handleSearch() {
        print(123)
    }
    
    override init() {
        super.init()
        // start doing something here maybe...
    }
}
