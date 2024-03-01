//
//  KioskMenuBoardView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class KioskMenuBoardView: UIView {
    private let menu = Menu()
    
    private(set) var menuSegmentedControl: UISegmentedControl = {
        let productType = ["신메뉴", "커피", "음료"]
        let sc = UISegmentedControl(items: productType)

        sc.selectedSegmentIndex = 0
        sc.selectedSegmentTintColor = .white
        
        sc.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        sc.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .semibold)], for: .normal)
        return sc
    }()
    
    private(set) lazy var menuCollectionView = MenuCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.configureSubviews()
        self.addUserActionListener()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureMenuSegmentedControl()
        self.configureMenuCollectionView()
    }
    
    private func configureMenuSegmentedControl() {
        self.addSubview(self.menuSegmentedControl)
        
        self.menuSegmentedControl
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.1)
    }
    
    private func configureMenuCollectionView() {
        self.addSubview(self.menuCollectionView)
        
        self.menuCollectionView
            .topAnchor(self.menuSegmentedControl.bottomAnchor)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)

        self.menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        self.menuCollectionView.delegate = self
        self.menuCollectionView.dataSource = self
    }
    
    private func addUserActionListener() {
        self.menuSegmentedControl.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
    }
    
    @objc private func segmentChanged() {
        self.menuCollectionView.reloadData()
    }
}

extension KioskMenuBoardView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let segmentIdx = self.menuSegmentedControl.selectedSegmentIndex
        let itemInfo = self.menu.itemList[segmentIdx][indexPath.row]
        let cell = self.menuCollectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MenuCollectionViewCell
        
        cell.setItemImage(itemInfo.image)
        cell.setItemName(itemInfo.name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let segmentIdx = self.menuSegmentedControl.selectedSegmentIndex
        
        return self.menu.itemList[segmentIdx].count
    }
}

extension KioskMenuBoardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.frame.width / 4 - 10
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}
