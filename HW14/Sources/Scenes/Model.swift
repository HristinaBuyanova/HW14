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
    var typeSection: Section
}

extension Model {
    static var array: [[Model]] {
        return [
            [Model(image: "1", title: "Недавние", countTitle: "28 485", typeSection: .myAlbums),
             Model(image: "2", title: "Избранное" , countTitle: "5", heart: "heart.fill", typeSection: .myAlbums),
             Model(image: "3", title: "Альбом 1" , countTitle: "143", typeSection: .myAlbums),
             Model(image: "4", title: "Альбом 2" , countTitle: "178", typeSection: .myAlbums),
             Model(image: "5", title: "Альбом 3" , countTitle: "1 204", typeSection: .myAlbums),
             Model(image: "6", title: "Альбом 4" , countTitle: "44", typeSection: .myAlbums),
             Model(image: "7", title: "Альбом 5" , countTitle: "5", typeSection: .myAlbums),
             Model(image: "8", title: "Альбом 6" , countTitle: "8", typeSection: .myAlbums),
             Model(image: "9", title: "Альбом 7" , countTitle: "444", typeSection: .myAlbums),
             Model(image: "10", title: "Альбом 8" , countTitle: "555", typeSection: .myAlbums),
             Model(image: "11", title: "Альбом 9" , countTitle: "666", typeSection: .myAlbums),
             Model(image: "12", title: "Альбом 10" , countTitle: "777", typeSection: .myAlbums),
             Model(image: "13", title: "Альбом 11" , countTitle: "888", typeSection: .myAlbums),
             Model(image: "14", title: "Альбом 12" , countTitle: "999", typeSection: .myAlbums),
             Model(image: "15", title: "Альбом 13" , countTitle: "10 000", typeSection: .myAlbums),
             Model(image: "16", title: "Альбом 14" , countTitle: "12", typeSection: .myAlbums)],

            [Model(image: "c1", typeSection: .peopleAndPlace),
             Model(image: "c2", typeSection: .peopleAndPlace),
             Model(image: "c3", title: "Люди", countTitle: "12", typeSection: .peopleAndPlace),
             Model(image: "c4", typeSection: .peopleAndPlace),
             Model(image: "карта", title: "Места", countTitle: "82", typeSection: .peopleAndPlace),],

            [Model(image: "video", title: "Видео", countTitle: "12", typeSection: .typeMedua),
             Model(image: "person.crop.square", title: "Селфи", countTitle: "45", typeSection: .typeMedua),
             Model(image: "livephoto", title: "Фото Live Photos", countTitle: "12", typeSection: .typeMedua),
             Model(image: "cube", title: "Портреты", countTitle: "12", typeSection: .typeMedua),
             Model(image: "rectangle.on.rectangle", title: "Серии", countTitle: "44", typeSection: .typeMedua),
             Model(image: "camera.viewfinder", title: "Снимки экрана", countTitle: "12", typeSection: .typeMedua),
             Model(image: "record.circle", title: "Записи экрана", countTitle: "32", typeSection: .typeMedua)],

            [Model(image: "square.and.arrow.down", title: "Импортированный", countTitle: "14", typeSection: .other),
             Model(image: "square.on.square", title: "Импортированный", countTitle: "119", typeSection: .other),
             Model(image: "eye.slash", title: "Скрыты", typeSection: .other),
             Model(image: "trash", title: "Недавно удаленные", typeSection: .other)]
        ]
    }
}


