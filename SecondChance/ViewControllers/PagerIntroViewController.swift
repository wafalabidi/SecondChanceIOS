//
//  PagerIntroViewController.swift
//  SecondChance
//
//  Created by macbook on 13/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class PagerIntroViewController: UIPageViewController , UIPageViewControllerDataSource {
    
    
    var list = [UIViewController]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for v in view.subviews {
            if v is UIScrollView {
                v.frame = view.bounds
                break
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "vc11")
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc12")
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc13")
        
        list.append(vc1!)
        list.append(vc2!)
        list.append(vc3!)
        
        
        setViewControllers([list[0]], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index < list.count - 1 {
            return list[index + 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index > 0 {
            return list[index - 1]
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}



