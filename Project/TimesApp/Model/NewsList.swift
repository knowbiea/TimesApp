//
//  NewsList.swift
//  TimesApp
//
//  Created by Arvind on 08/07/22.
//

import UIKit

struct NewsList: Codable {
    let status: String?
    let copyright: String?
    let numResults: Int?
    let results: [News]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case numResults = "num_results"
        case results = "results"
    }
}

struct News: Codable {
    let uri: String?
    let url: String?
    let id: Int?
    let assetID: Int?
    let source: String?
    let publishedDate: String?
    let updated: String?
    let section: String?
    let subsection: String?
    let nytdsection: String?
    let adxKeywords: String?
    let column: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let desFacet: [String]?
    let orgFacet: [String]?
    let perFacet: [String]?
    let geoFacet: [String]?
    let media: [NewsMedia]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri = "uri"
        case url = "url"
        case id = "id"
        case assetID = "asset_id"
        case source = "source"
        case publishedDate = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adxKeywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media = "media"
        case etaID = "eta_id"
    }
}

struct NewsMedia: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [NewsMetadata]?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct NewsMetadata: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
