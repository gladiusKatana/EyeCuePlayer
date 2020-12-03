// eyeCuePlayer ･ HomeVCSetup.swift
import UIKit

extension HomeVC {
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView?.backgroundColor = icyBlue   //collectionView?.isPagingEnabled = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellIdZero)
        collectionView?.register(CellOne.self, forCellWithReuseIdentifier: cellIdOne)
        collectionView?.register(CellTwo.self, forCellWithReuseIdentifier: cellIdTwo)
        collectionView?.register(CellThree.self, forCellWithReuseIdentifier: cellIdThree)
        //collectionView?.register(TestCellZero.self, forCellWithReuseIdentifier: testCellIdZero)
        
        let edgeInsetTopOffset = CGFloat(-0.0261 * view.frame.height) - 7   //original value (derivation ?)
        //print("edgeInsetTopOffset = \(edgeInsetTopOffset)")
        collectionView?.contentInset = UIEdgeInsets.init(top: edgeInsetTopOffset, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        //collectionView?.indicatorStyle = UIScrollViewIndicatorStyleBlack
    }
    
    func setupNavBarButtons() {
        let image = UIImage(named: "settingsButton")?.withRenderingMode(.alwaysTemplate)
        //let uploadImage = UIImage(named: "uploadButton")?.withRenderingMode(.alwaysTemplate)
        
        let settingsButton = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: #selector(showAltSettingsPanel))
        settingsButton.tintColor = .white
        
        let anothersettingsButton = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: #selector(showAltSettingsPanel))
        anothersettingsButton.tintColor = UIColor.rgb(91, green: 14, blue: 13, alpha: 0)
        
        let originalPlusImage = UIImage(named: "+forMenuBar")?.withRenderingMode(.alwaysTemplate)
        let uploadButton = UIBarButtonItem(image: originalPlusImage, landscapeImagePhone: originalPlusImage, style: .plain, target: self, action: #selector(selectImageTurnedOffMessage))
        uploadButton.tintColor = UIColor.rgb(152, green: 83, blue: 13, alpha: 1) //.orange //91/14/13
        navigationItem.rightBarButtonItems = [uploadButton, settingsButton, anothersettingsButton/*, uploadButton*/]
    }
    
    func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(34)]-|", views: menuBar)
    }
}

