//
//  Team.swift
//  JulyReturnDateApp
//
//  Created by Eiji Kushida on 2018/07/05.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

struct Member: Decodable {
    /// メンバー名
    var name = ""
}

struct Team: Decodable {
    /// チーム名
    var name = ""
    
    /// 画面遷移メソッド
    var method = ""
    
    /// チームナンバー
    var number = 0
    
    /// チームメンバー
    let member : [Member]
}

struct Teams: Decodable {
    let teams: [Team]
}

extension Team {
    
    static func fetchTeams() -> [Team] {
        
        guard let jsonString = Bundle.loadJson(fileName: "teams") else {
            assertionFailure("JSONデータが読み込めませんでした。")
            return []
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            assertionFailure("JSONデータに変換できませんでした。")
            return []
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode(Teams.self, from: data) else {
            assertionFailure("JSONのデコードに失敗しました。")
            return []
        }
        return result.teams
    }
}

