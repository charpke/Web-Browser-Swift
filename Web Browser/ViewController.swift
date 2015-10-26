//
//  ViewController.swift
//  Web Browser
//
//  Created by Chuck Harpke on 10/25/15.
//  Copyright © 2015 Chuck Harpke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var address: String = String()
    
    

    @IBOutlet weak var webAddress: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func goPressed(sender: AnyObject) {
        webAddress.resignFirstResponder()
        loadWebPage()
    }
    
    
    @IBAction func leftPressed(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func rightPressed(sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func zoomInPressed(sender: AnyObject) {
        webView.scrollView.zoomScale += 0.1
    }
    
    @IBAction func zoomOutPressed(sender: AnyObject) {
        webView.scrollView.zoomScale -= 0.1
    }
    func loadWebPage() {
    
        if webAddress.text != "" {
        
            address = address.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            address = self.webAddress.text!
            
            if address.hasPrefix("www.") {
                address = "http://" + address
                
            }else if !address.hasPrefix("http://") {
            
                address = "http://" + address
            }
            
            let url = NSURL(string: address)
            let request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webAddress.delegate = self
        webView.scalesPageToFit = true
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        webAddress.resignFirstResponder()
        loadWebPage()
        return true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

