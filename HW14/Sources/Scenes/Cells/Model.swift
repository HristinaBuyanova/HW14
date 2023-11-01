//
//  Model.swift
//  HW14
//
//  Created by Христина Буянова on 30.10.2023.
//

import Foundation

enum Section: CaseIterable {
    case myAlbums
    case peopleAndPlace
    case typeMedua
    case other
}

struct Model {
    var image: String
    var title: String?
    var countTitle: String?
    var heart: String?
}

extension Model {
    static var array: [[Model]] {
        return [[
            Model(image: "1", title: "Недавние", countTitle: "28 485"),
            Model(image: "2", title: "Избранное" , countTitle: "5", heart: "heart.fill"),
            Model(image: "3", title: "Альбом 1" , countTitle: "143"),
            Model(image: "4", title: "Альбом 2" , countTitle: "178"),
            Model(image: "5", title: "Альбом 3" , countTitle: "1 204"),
            Model(image: "6", title: "Альбом 4" , countTitle: "44"),
            Model(image: "7", title: "Альбом 5" , countTitle: "5"),
            Model(image: "8", title: "Альбом 6" , countTitle: "8"),
            Model(image: "9", title: "Альбом 7" , countTitle: "444"),
            Model(image: "10", title: "Альбом 8" , countTitle: "555"),
            Model(image: "11", title: "Альбом 9" , countTitle: "666"),
            Model(image: "12", title: "Альбом 10" , countTitle: "777"),
            Model(image: "13", title: "Альбом 11" , countTitle: "888"),
            Model(image: "14", title: "Альбом 12" , countTitle: "999"),
            Model(image: "15", title: "Альбом 13" , countTitle: "10 000"),
            Model(image: "16", title: "Альбом 14" , countTitle: "12")
        ]]
    }
}


