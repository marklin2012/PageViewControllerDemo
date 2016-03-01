//
//  ViewController.swift
//  PageChange
//
//  Created by O2.LinYi on 16/2/29.
//  Copyright © 2016年 jd.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!

    var pageViewCtl : UIPageViewController?
    
    var viewCtls : [UIViewController]?
    
    var number = 0
    
    // MARK: - Life cycle
    override func viewWillAppear(animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.size.width * 4, height: 200)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageViewCtl = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewCtl?.delegate = self
        pageViewCtl?.dataSource = self
        
        let vc1 = FirstTableViewController()
        let vc2 = SecondTableViewController()
        let vc3 = ThirdTableViewController()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc4 = storyBoard.instantiateViewControllerWithIdentifier("Fourth")
        
        viewCtls = [vc1, vc2, vc3, vc4]
        
        let vcs = [vc1]
        
        pageViewCtl?.setViewControllers(vcs, direction: .Forward, animated: true, completion: nil)
        
        addChildViewController(pageViewCtl!)
        view.addSubview(pageViewCtl!.view)
        
        pageViewCtl?.view.frame = CGRect(x: 0, y: 200, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height - 200)
        pageViewCtl?.didMoveToParentViewController(self)
        
        for i in 0..<4 {
            let v = UIView(frame: CGRect(x: 0 + screenWidth() * CGFloat(i), y: 0, width: screenWidth(), height: 200))
            v.backgroundColor = o2_randomColor()
            scrollView.addSubview(v)
        }
        
        scrollView.delegate = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIPageViewController delegate methods
//    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
//        return .Min
//    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        print(pendingViewControllers)
        let vc = pendingViewControllers[0]
        
        print(vc.view.frame)
    }
    
    // MARK: - UIPageViewController dataSource methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = viewCtls!.indexOf(viewController)
        print("before" + "\(index)")
        var number = index! - 1
        
        if number < 0 {

            number = (viewCtls?.count)! - 1
            return nil
        }
        
        
        return viewCtls![number]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = viewCtls!.indexOf(viewController)
        print("after" + "\(index)")
        var number = index! + 1
        
        if number >= viewCtls?.count {
            
            
            number = 0
            return nil
        }
        
        return viewCtls![number]
        
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        print("didScroll")
    }
    
    var lastX : CGFloat = 0

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
//        print("contentOffset.x:" + "\(scrollView.contentOffset.x)")
//        print("scrollWidth:" + "\(scrollView.frame.size.width)")
//        print("page:" + "\(page)")
        
        let direction = (scrollView.contentOffset.x - lastX) >= 0 ? UIPageViewControllerNavigationDirection.Forward : UIPageViewControllerNavigationDirection.Reverse
        
        pageViewCtl?.setViewControllers([viewCtls![page]], direction: direction, animated: true, completion: nil)
        
        lastX = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
    }

}

