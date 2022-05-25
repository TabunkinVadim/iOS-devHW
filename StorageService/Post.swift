
//
//  Post.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import Foundation

public struct Post {
    public let author: String
    public let image: String
    public let description: String
    public var likes: Int
    public var views: Int
    public let title: String

    public init(author: String, image: String, description: String,likes: Int,views: Int, title:String) {
        self .author = author
        self .image = image
        self .description = description
        self .likes = likes
        self .views = views
        self .title = title
    }
}

public var post1 = Post(author: "ZinovkinArt", image: "img_1", description: "Здесь опять простая символика, о её значении пусть каждый решает сам.", likes: 230, views: 900, title: "")

public var post2 = Post(author: "Книги", image: "img_2", description: "Уникальный арт-объект «Потерянная книга»", likes: 120, views: 700, title: "")

public var post3 = Post(author: "Books", image: "img_3", description: "Прoклятущая лень! Кaкой я был бы cлавный чeловек, кoли бы oна мнe нe мeшaлa.\n— Л. Н. Тoлстoй", likes: 300, views: 2500, title: "")

public var post4 = Post(author: "Мульт", image: "img_4", description: "Ежик в тумане", likes: 800, views: 43000, title: "")
public var posts = [post1, post2, post3, post4]
