//
//  KioskOrderStatusView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class KioskCartView: UIView {
    private(set) var orderCountView = OrderCountView()
    private(set) var orderStatusTableView = OrderStatusTableView(frame: .zero, style: .plain)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.orderStatusTableView.delegate = self
        self.orderStatusTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureOrderCountView()
        self.configureOrderStatusTableView()
    }
    
    private func configureOrderCountView() {
        self.addSubview(self.orderCountView)
        
        self.orderCountView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.1)
    }
    
    private func configureOrderStatusTableView() {
        self.addSubview(self.orderStatusTableView)
        
        self.orderStatusTableView
            .topAnchor(self.orderCountView.bottomAnchor)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .register(OrderStatusTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
}

extension KioskCartView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.orderStatusTableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! OrderStatusTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
