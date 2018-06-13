//
//  ViewController.swift
//  DrawingProjects
//
//  Created by Vitor Rodrigues on 06/06/2018.
//  Copyright © 2018 Vitor Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircularProgressView!
    
    @IBOutlet weak var sizeConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resizeContainer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.progressView.progress = 50
        }
    }
    
    private func resizeContainer() {
//        sizeConstraint.constant = sizeConstraint.constant == 80 ? 160 : 80
        UIView.animate(withDuration: 1.0) {
//            self.progressView.layoutIfNeeded()
            self.progressView.transform = CGAffineTransform(translationX: 80, y: 90)
        }
    }
}
