//
//  SettingLabViewController.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/8/9.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class SettingLabViewController: ASViewController<ASDisplayNode> {
    
    private let tableNode = ASTableNode()
    
    init() {
        super.init(node: ASDisplayNode())
        node.addSubnode(tableNode)
        tableNode.dataSource = self
        tableNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        node.backgroundColor = UIColor(hexString: "#F1A555")
        tableNode.frame = view.bounds
        tableNode.backgroundColor = .clear
        tableNode.view.separatorStyle = .none
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 260))
        let headerNode = SettingLabHeaderNode()
        headerNode.frame = headerView.bounds
        headerView.addSubnode(headerNode)
        tableNode.view.tableHeaderView = headerView
    
        let footerNode = SettingLabFooterNode()
        footerNode.frame = CGRect(x: 0, y: view.bounds.height - 117 - Constants.bottomInset - Constants.topInset, width: view.bounds.width, height: 117 + Constants.bottomInset)
        footerNode.linkButtonHandler = { [weak self] in
            self?.navigateToAgreement()
        }
        tableNode.addSubnode(footerNode)
        
        navigationItem.title = "插件"
    }
    
    private func navigateToAgreement() {
        guard let url = Constants.labAgreementURL else { return }
        let webVC = WebViewController(url: url)
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var wc_navigationBarBackgroundColor: UIColor? {
        return UIColor(hexString: "#F1A555")
    }
    
    override var wc_titleTextAttributes: [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override var wc_barTintColor: UIColor? {
        return .white
    }
}

// MARK: - ASTableDelegate & ASTableDataSource
extension SettingLabViewController: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 0
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let block: ASCellNodeBlock = {
            return ASCellNode()
        }
        return block
    }
    
}
