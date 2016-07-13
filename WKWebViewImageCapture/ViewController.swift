//
//  ViewController.swift
//  WKWebViewImageCapture
//
//  Created by Jed Soane on 13/07/16.
//
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView!
    @IBOutlet weak var photoPreview: UIImageView!
  
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupWebView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func takePhoto(sender: AnyObject)
    {
        UIGraphicsBeginImageContextWithOptions(webView.bounds.size, true, 0.0)
        
        let drewOK = webView.drawViewHierarchyInRect(webView.bounds, afterScreenUpdates: true)
        
        if (!drewOK)
        {
            print("drawViewHierarchyInRect failed")
        }
        
        let overlayImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        photoPreview.image = overlayImage
    }

    // MARK: Web View
    func setupWebView()
    {
        webView = WKWebView(frame: view.frame)
        webView.opaque = false
        webView.backgroundColor = UIColor.clearColor()
        webView.layer.backgroundColor = UIColor.clearColor().CGColor
        
        if let url = NSURL(string: "http://madebyevan.com/webgl-water/")
//        if let url = NSURL(string: "http://8i.com/p/G6j")
//        if let url = NSURL(string: "http://cubictime.ru")
        {
            let transparentWebPageRequest = NSURLRequest(URL: url)
            webView.loadRequest(transparentWebPageRequest)
        }
        
        view.insertSubview(webView, belowSubview: photoPreview)
    }

}

