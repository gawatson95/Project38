//
//  DetailViewController.swift
//  Project38
//
//  Created by Grant Watson on 11/29/22.
//
import WebKit
import UIKit

class DetailViewController: UIViewController, WKUIDelegate {

    @IBOutlet var detailLabel: UILabel!
    
    var webView: WKWebView!
    var detailItem: Commit?
    
    override func viewDidLoad() {
        
        if let detail = self.detailItem {
            let wvHeight = view.frame.height - 280
            let wvWidth = view.frame.width - 20
            
            self.webView = WKWebView(frame: CGRect(x: 10, y: 240, width: wvWidth, height: wvHeight))
            view.addSubview(self.webView)

            let myURL = URL(string: detail.url)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        
            detailLabel.text = detail.message
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }
    }
    
    @objc func showAuthorCommits() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AuthorCommit") as? AuthorCommitTableViewController {
            vc.author = detailItem?.author
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
