//
//  ViewController.swift
//  Stacks
//
//  Created by Aaron Wright on 6/9/15.
//  Copyright © 2015 Aaron Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var forward = true
    var index = -1
    
    @IBOutlet weak var stackView: UIStackView!

    @IBAction func toggle(sender: UIButton) {
        UIView.animateWithDuration(0.25) { () -> Void in
            if self.stackView.axis == .Horizontal {
                self.stackView.axis = .Vertical
            }
            else {
                self.stackView.axis = .Horizontal
            }
        }
    }
    
    @IBAction func remove(sender: UIButton) {
        self.forward ? self.index++ : self.index--
        
        if self.index >= self.stackView.arrangedSubviews.count {
            self.index--
            self.forward = false
        } else if self.index < 0 {
            self.index++
            self.forward = true
        }
        
        UIView.animateWithDuration(0.25) { () -> Void in
            self.stackView.arrangedSubviews[self.index].hidden = self.forward
        }
    }
}

