//  Created by ikizey on 21.08.2021.


import UIKit


class FriendsPhotosCollectionViewController: UICollectionViewController {

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userPhoto", for: indexPath) as? UserCollectionViewCell else {
            fatalError("Can't convert cell to UserCollectionViewCell")
        }
        cell.imageView.image = user.image
        cell.textLabel.text = user.name
        return cell
    }
}
