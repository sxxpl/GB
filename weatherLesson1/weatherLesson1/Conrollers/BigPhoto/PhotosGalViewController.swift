//
//  PhotosGalViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 07.04.2022.
//

import UIKit

class PhotosGalViewController: UIViewController {
    
    public var profImage = [UIImage]()
    public var selectedPhotoIndex:Int = 0
    
    private let additionalImageView = UIImageView()
    
    @IBOutlet var bigPhotoImage:UIImageView!{
        didSet{
            bigPhotoImage.isUserInteractionEnabled = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !profImage.isEmpty else {return}
        bigPhotoImage.image = profImage[selectedPhotoIndex]
       
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeFunc))
        leftSwipe.direction = .left
        bigPhotoImage.addGestureRecognizer(leftSwipe)
        
        view.addSubview(additionalImageView)
        view.sendSubviewToBack(additionalImageView)
        additionalImageView.translatesAutoresizingMaskIntoConstraints  = false
        additionalImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            additionalImageView.leadingAnchor.constraint(equalTo: bigPhotoImage.leadingAnchor),
            additionalImageView.trailingAnchor.constraint(equalTo: bigPhotoImage.trailingAnchor),
            additionalImageView.topAnchor.constraint(equalTo: bigPhotoImage.topAnchor),
            additionalImageView.bottomAnchor.constraint(equalTo: bigPhotoImage.bottomAnchor)])
    }
    
    @objc func leftSwipeFunc(){
        guard selectedPhotoIndex + 1 <= profImage.count-1 else {return}
        
        additionalImageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        additionalImageView.image=profImage[selectedPhotoIndex+1]
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.bigPhotoImage.transform = CGAffineTransform(translationX: -self.bigPhotoImage.bounds.width, y: 0)
            self.additionalImageView.transform = .identity
        },
                       completion: {_ in
            self.selectedPhotoIndex+=1
            self.bigPhotoImage.image=self.profImage[self.selectedPhotoIndex]
            self.bigPhotoImage.transform = .identity
        })
        
        
    }
    

  
    @IBAction func rightSwipeFunc(_ sender: UISwipeGestureRecognizer) {
        guard selectedPhotoIndex  >= 1 else {return}
        view.sendSubviewToBack(bigPhotoImage)
        additionalImageView.transform = CGAffineTransform(translationX: -1.5*additionalImageView.bounds.width, y: 0).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
        additionalImageView.image=profImage[selectedPhotoIndex-1]
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
            self.bigPhotoImage.transform=CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.additionalImageView.transform = .identity
        }, completion: {_ in
            self.selectedPhotoIndex-=1
            
            self.bigPhotoImage.image = self.profImage[self.selectedPhotoIndex]
            self.view.sendSubviewToBack(self.additionalImageView)
            self.bigPhotoImage.transform = .identity
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PhotosGalViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        cell.profPhoto.image = profImage[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profImage.count
    }
    
}
