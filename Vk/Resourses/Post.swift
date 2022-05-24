//
//  Post.swift
//  Navigation
//
//  Created by Табункин Вадим on 03.03.2022.
//

import Foundation

struct Post {
    let author: String
    let image: String
    let description: String
    var likes: Int
    var views: Int
    let title: String
}

var post1 = Post(author: "ZinovkinArt", image: "img_1", description: "Здесь опять простая символика, о её значении пусть каждый решает сам.", likes: 230, views: 900, title: "")

var post2 = Post(author: "Книги", image: "img_2", description: "Уникальный арт-объект «Потерянная книга»", likes: 120, views: 700, title: "")

var post3 = Post(author: "Books", image: "img_3", description: "Прoклятущая лень! Кaкой я был бы cлавный чeловек, кoли бы oна мнe нe мeшaлa.\n— Л. Н. Тoлстoй", likes: 300, views: 2500, title: "")

var post4 = Post(author: "Мульт", image: "img_4", description: "Ежик в тумане", likes: 800, views: 43000, title: "")
var posts = [post1, post2, post3, post4]
