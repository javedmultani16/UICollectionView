//
//  ViewController.swift
//  collectionDemo
//
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var arrayData = [String]()
    @IBOutlet weak var collectionViewData: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewData.delegate = self
        self.collectionViewData.dataSource = self
        self.arrayData = ["1","2","3","4","5","6","7","8","9","10"]
        
        let spacingCell : CGFloat = 8.0
        let cellSize : CGFloat = (self.view.frame.size.width - spacingCell*3)/2
        let collectionViewLayout: UICollectionViewFlowLayout = (self.collectionViewData!.collectionViewLayout as! UICollectionViewFlowLayout)
        collectionViewLayout.sectionInset = UIEdgeInsetsMake(spacingCell, spacingCell, spacingCell,spacingCell)
        collectionViewLayout.minimumInteritemSpacing = spacingCell
        collectionViewLayout.itemSize = CGSize(width: cellSize, height: cellSize*0.8)
        collectionViewLayout.scrollDirection = .vertical
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- collection view methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:"MyCollectionViewCell", for: indexPath as IndexPath)
        if let labelName = cell.viewWithTag(10) as? UILabel{
            labelName.text = self.arrayData[indexPath.item]
        }
        return cell
    }
}

