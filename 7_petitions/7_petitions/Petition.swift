//
// Created by Janis Cimbulis on 14/10/2020.
//

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct PetitionList: Codable {
    var results: [Petition]
}