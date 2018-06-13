//
//  MockPageViewController.swift
//  DrawingProjects
//
//  Created by Vitor Rodrigues on 13/06/2018.
//  Copyright © 2018 Vitor Rodrigues. All rights reserved.
//

import UIKit

class MockPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var mocks: [UIViewController] = {
        
       return [
            storyboard!.instantiateViewController(withIdentifier: "mock1"),
            storyboard!.instantiateViewController(withIdentifier: "mock2"),
            storyboard!.instantiateViewController(withIdentifier: "mock3")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        let mocks = self.mocks
        
        setViewControllers([mocks[0]], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return mocks.count
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = mocks.index(of: viewController), index+1 < mocks.count else { return nil }
        return mocks[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = mocks.index(of: viewController), index-1 >= 0 else { return nil }
        return mocks[index - 1]
    }

}
