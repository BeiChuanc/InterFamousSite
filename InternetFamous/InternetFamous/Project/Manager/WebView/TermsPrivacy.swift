//
//  TermsPrivacy.swift
//  InternetFamous
//
//  Created by 北川 on 2024/12/17.
//

import Foundation
import UIKit
import WebKit
import SnapKit

class TermsPrivacy: ParentControllerManager {
    
    var htmlFileName: String?              // Bundle filename
    
    var topView = UIView.init()            // TopView
    
    var leftBack = UIButton(type: .custom) // Back Button
    
    var labTop = UILabel.init()            // TermsPrivacy
    
    private lazy var webView: WKWebView = {
        var web = WKWebView()
        let config = WKWebViewConfiguration()
        web = WKWebView(frame: .zero, configuration: config)
        web.allowsLinkPreview = true
        web.allowsBackForwardNavigationGestures = true
        web.uiDelegate = self
        web.navigationDelegate = self
        return web
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadHTMLContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setupUI() {
        
        leftBack.setImage(UIImage(named: "btnBack"), for: .normal)
        leftBack.addTarget(self, action: #selector(viewDismiss), for: .touchUpInside)
        labTop.font = UIFont().with(fontName: "GeezaPro-Bold", sizeFont: 16)
        
        view.addSubview(webView)
        view.addSubview(topView)
        topView.addSubview(leftBack)
        topView.addSubview(labTop)
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        topView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        leftBack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
        
        labTop.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    private func loadHTMLContent() {
        guard let fileName = htmlFileName else { return }
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            print("在项目中未找到指定的HTML文件")
        }
    }
}

extension TermsPrivacy: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        labTop.text = webView.title
        print("HTML页面加载完成")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        labTop.text = "Error"
        print("HTML页面加载失败，错误信息: \(error.localizedDescription)")
    }

}
