//
//  ViewController.swift
//  testi
//
//  Created by Jawad Ali on 11/08/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import Switches
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "JD Switches"
    }
}

//MARK:- CollectionView Delegate

extension UIViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SwitchType.allCases.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            
            let getCase = SwitchType.allCases[indexPath.row]
            cell.config(type: getCase)
            
            cell.performSgue = {[unowned self] identifier in
                self.performSegue(withIdentifier: identifier, sender: nil)
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
}

//MARK:- Flow layout delegate
extension UIViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.bounds.width) / 2
        let height = width * 1.15
        return CGSize(width: width, height: height)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
