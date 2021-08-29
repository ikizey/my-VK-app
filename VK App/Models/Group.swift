//  Created by ikizey on 29.08.2021.


import UIKit


struct Group {
    let name: String
    let image: UIImage

    private static func generate_image() -> UIImage {
        let options = [
            "person.3",
            "person.3.fill",
//            "person.3.sequence",
//            "person.3.sequence.fill",
        ]
        return UIImage(systemName: options.randomElement()!)!
    }

    private static func generate_name() -> String {
        let options = [
            "Cats",
            "Dogs",
            "iOS",
            "Cartoons",
            "Movies",
            "Music",
            "TVshows",
            "Science",
        ]
        return options.randomElement()!
    }

    static func generate() -> Group {
        Group(name: Group.generate_name(), image: Group.generate_image())
    }
}
