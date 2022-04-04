//
//  Data.swift
//  ApiFetchTest
//
//  Created by Himanshu Sharma on 2022/04/02.
//

import Foundation

struct ImageList : Codable {
    var id : String!
    var author : String!
    var width : Int!
    var height : Int!
    var url : String!
    var download_url : String!
}
