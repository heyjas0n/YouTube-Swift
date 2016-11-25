//
//  Extensions.swift
//  YouTube-Swift
//
//  Created by Nguyen, Jason on 11/25/16.
//  Copyright © 2016 Jason Nguyen. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    
    func loadImageUsingUrlString(urlString: NSString) {
        // Set up the URL request
        guard let url = URL(string: urlString as String) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
            self.image = UIImage(data: data!)
            
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str as Any)
        })
        
        task.resume()
    }
    
}





