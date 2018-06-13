//
//  ContainerViewController.swift
//  DrawingProjects
//
//  Created by Vitor Rodrigues on 13/06/2018.
//  Copyright © 2018 Vitor Rodrigues. All rights reserved.
//

import UIKit
extension UIView {
    
    /**
     Makes this view fulfill entirely another view with constraints to match all of its 4 sides
     */
    func fill(_ view: UIView, inset: CGFloat = 0) {
        fill(view, left: inset, top: inset, right: inset, bottom: inset)
    }
    
    func fill(_ view: UIView, left: CGFloat = 0, top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: right).isActive = true
    }
}
class ContainerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "page") {
            addChildViewController(vc)
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(vc.view)
            vc.view.fill(containerView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
