//
//  TabBarController.swift
//  HW14
//
//  Created by Христина Буянова on 29.10.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewController()
    }

    private func setupTabBarController() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
    }

    private func setupTabBarViewController() {
        let mediaLibraryVC = MediaLibraryViewController()
        let mediaLibraryIcon = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        mediaLibraryVC.tabBarItem = mediaLibraryIcon

        let forYouVC = ForYouViewController()
        let forYouIcon = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), selectedImage: UIImage(systemName: "heart.text.square"))
        forYouVC.tabBarItem = forYouIcon

        let albumsVC = AlbumsViewController()
        let albumsIcon = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumsVC.tabBarItem = albumsIcon

        let searchVC = SearchViewController()
        let seachIcon = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        searchVC.tabBarItem = seachIcon

        let mediaLibraryNC = UINavigationController(rootViewController: mediaLibraryVC)
        let forYouNC = UINavigationController(rootViewController: forYouVC)
        let albumsNC = UINavigationController(rootViewController: albumsVC)
        let searchNC = UINavigationController(rootViewController: searchVC)

        let contrillers = [mediaLibraryNC, forYouNC, albumsNC, searchNC]
        self.setViewControllers(contrillers, animated: true)
    }
}
