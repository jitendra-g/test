//
//  ViewController.swift
//  test
//
//  Created by webwerks on 28/06/16.
//  Copyright © 2016 webwerks. All rights reserved.
//

import UIKit

enum CellID: String {
    case Home
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: CellID.Home.rawValue)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellID.Home.rawValue, forIndexPath: indexPath)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blueColor()
        return imageView
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.greenColor()
        return imageView
    }()
    
    let sepratorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.brownColor()
        return label
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(sepratorView)
        addSubview(profileImage)
        addSubview(titleLabel)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]-8-[v1]-16-|", views: profileImage, titleLabel)
        
        addConstraintsWithFormat("H:|[v0]|", views: sepratorView)
        
        //Verticle Constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileImage, sepratorView)
        addConstraintsWithFormat("V:[v0]-8-[v1(22)]", views: thumbnailImageView, titleLabel)
        
    
        
        //self.backgroundColor = UIColor.redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        
        for (index, view) in views.enumerate() {
            viewDictionary["v\(index)"] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}



