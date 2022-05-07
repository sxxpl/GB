//
//  FriendCollectionViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"


class FriendCollectionViewController: UICollectionViewController {
    
    
    var id = Int()
    let service = VKService()
    var VKFriendsPhotoModel: Results<VKFriendsPhoto>?
    var photos = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        loadPhotos()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionCell", for: indexPath) as? FriendCollectionViewCell
        else { exit(0) }
        
        cell.friendPhoto.image = photos[indexPath.row]
        
       
        
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotos",
           let allPhotoVC = segue.destination as? PhotosGalViewController,
           let selectedPhoto = collectionView.indexPathsForSelectedItems?.first
        {
            allPhotoVC.selectedPhotoIndex = selectedPhoto.item
            allPhotoVC.profImage = photos
        }
    }
    
    private func loadPhotos(){
        service.getPhotos(id: self.id) { [weak self]  in
                DispatchQueue.main.async {
                    self?.VKFriendsPhotoModel = self?.loadFriendsFromRealm()
                    self?.infoTransform()
                    self?.collectionView.reloadData()
                }
        }
    }
    
    func loadFriendsFromRealm() -> Results<VKFriendsPhoto>?{
        do{
            let realm = try Realm()
            let photos = realm.objects(VKFriendsPhoto.self)
            return photos
        } catch {
            print(error)
            return nil
        }
    }
    
    private func infoTransform(){
        for response in VKFriendsPhotoModel?.first?.response?.items ?? List<FriendPhotoInformationResponse>() {
            self.photos.append(UIImage(data: try! Data(contentsOf: URL(string: response.sizes[response.sizes.endIndex-1].url)!))!)
        }
    }

}
