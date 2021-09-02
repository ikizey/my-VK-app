//  Created by ikizey on 29.08.2021.


import UIKit


struct User {
    let name: String
    let image: UIImage

    private static func generate_image() -> UIImage {
        let options = [
            "person.fill",
            "person",
            "person.circle",
            "person.circle.fill",
            "person.fill.checkmark",
        ]
        return UIImage(systemName: options.randomElement()!)!
    }

    private static func generate_name() -> String {
        let options = [
            "Alex",
            "Jack",
            "Peter",
            "Jane",
            "Martha",
            "Sonya",
            "Sean",
            "Mia",
        ]
        return options.randomElement()!
    }

    static func generate() -> User {
        User(name: User.generate_name(), image: User.generate_image())
    }
}


