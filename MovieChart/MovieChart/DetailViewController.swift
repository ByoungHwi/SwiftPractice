//
//  DetailViewController.swift
//  MovieChart
//
//  Created by Byoung-Hwi Yoon on 2020/07/26.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    @IBOutlet var webkitView: WKWebView!
    @IBOutlet var indicatorLoading: UIActivityIndicatorView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.mvo.title
        self.webkitView.navigationDelegate = self
        
        
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        self.webkitView.load(req)
    }
}

extension DetailViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.indicatorLoading.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicatorLoading.stopAnimating()
    }
    
}
