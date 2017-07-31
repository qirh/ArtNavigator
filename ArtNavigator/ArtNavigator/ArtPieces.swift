//
//  ArtPieces.swift
//  ArtNavigator
//
//  Created by saleh on 7/30/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation

// presistance source:
// http://mhorga.org/2015/08/25/ios-persistence-with-nscoder-and-nskeyedarchiver.html
// and : https://stackoverflow.com/a/34128089

class ArtPieces {
    static var artPieces: [ArtPiece] = []
    
    struct Keys {
        static let ArtPieces = "artPieces"
    }
    
    init(artPieces: [ArtPiece]) {
        print("init(artPieces: [ArtPiece])")
        ArtPieces.artPieces = artPieces
    }
    
    func encode(with aCoder: NSCoder) {
        print("ArtPieces: func encode(with aCoder: NSCoder)")
        aCoder.encode(ArtPieces.artPieces, forKey: Keys.ArtPieces)
    }
    
    required init(coder unarchiver: NSCoder) {
        print("required init(coder unarchiver: NSCoder)")
        //super.init()
        ArtPieces.artPieces = unarchiver.decodeObject(forKey: Keys.ArtPieces) as! [ArtPiece]
    }
  
    static func addArtPiece(artPiece: ArtPiece) {
        //print("static func addArtPiece(artPiece: ArtPiece)")
        artPieces.append(artPiece)
    }
    
    static func printArtPieces() {
        print("printArtPieces -- start")
        /*
        for artPiece in artPieces {
            
            print("Accession Number =  \(artPiece.accessionNumber)")
            print("Title =  \(artPiece.title)")
            print("Location Name =  \(artPiece.locationName)")
            print("Latitude =  \(artPiece.latitude)")
            print("Longitude =  \(artPiece.longitude)")
            print("Address =  \(artPiece.address)")
            print("Category = \(artPiece.category)")
            print("Material = \(artPiece.material)")
            
            
            print("****")
        }
        */
        print("printArtPieces -- end")
    }
    
    static func commitArtPieces(){
    
    }
}

// source:
// https://stackoverflow.com/a/30009873
enum Category : String {                        //Values in JSON file
    case sculpture = "Sculpture"                //Sculpture
    case mural = "Mural"                        //Mural
    case electronicMedia = "Electronic Media"   //Electronic Media
}

class ArtPiece : NSObject, NSCoding{
    
                                    //Column Names in JSON file
    var accessionNumber: String     //Accession Number i.e id on the city's website
    var lastName: String?           //Last Name
    var firstName: String?          //First Name
    var artistGender: String?       //Artist Gender             //never saved? should i delete?
    var title: String               //Title
    var year: String?               //Year
    
    var locationName: String        //Location Name
    var latitude: Int               //Latitude
    var longitude: Int              //Longitude
    var address: String             //Address
    var locationDescription: String?    //Location Description
    
    var isInterior: Bool                //Interior-Exterior
    var category: Category              //Category
    var objectType: String              //Object Type
    var material: String?               //Material
    var materialDetails: String?        //Material Details
    var size: String?                   //Size
    var additionalDescription: String?  //Additional Description
    var aboutTheWork: String?           //About The Work
    
    struct Keys {
        
        static let AccessionNumber = "accessionNumber"
        static let LastName = "lastName"
        static let FirstName = "firstName"
        static let ArtistGender = "artistGender"
        static let Title = "title"
        static let Year = "year"
        
        static let LocationName = "locationName"
        static let Latitude = "latitude"
        static let Longitude = "longitude"
        static let Address = "address"
        static let LocationDescription = "locationDescription"
        
        static let IsInterior = "isInterior"
        static let Category = "category"
        static let ObjectType = "objectType"
        static let Material = "material"
        static let MaterialDetails = "materialDetails"
        static let Size = "size"
        static let AdditionalDescription = "additionalDescription"
        static let AboutTheWork = "aboutTheWork"
    }
    
    //required params
    init(accessionNumber: String, title: String, locationName: String, latitude: Int, longitude: Int, address: String, isInterior: Bool, category: Category, objectType: String){
        //print("init(accessionNumber: String ...")
        
        self.accessionNumber = accessionNumber
        self.title = title
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.isInterior = isInterior
        self.category = category
        self.objectType = objectType
    }
    //all params
    init(accessionNumber: String, lastName: String?, firstName: String?, artistGender: String?, title: String, year: String?, locationName: String, latitude: Int, longitude: Int, address: String, locationDescription: String?, isInterior: Bool, category: Category, objectType: String, material: String?, materialDetails: String?, size: String?, additionalDescription: String?, aboutTheWork: String?) {
        
        self.accessionNumber = accessionNumber
        self.lastName = lastName
        self.firstName = firstName
        self.artistGender = artistGender
        self.title = title
        self.year = year
        
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.locationDescription = locationDescription
        
        self.isInterior = isInterior
        self.category = category
        self.objectType = objectType
        self.material = material
        self.materialDetails = materialDetails
        self.size = size
        self.additionalDescription = additionalDescription
        self.aboutTheWork = aboutTheWork
    }
    
    func encode(with aCoder: NSCoder) {
        print("ArtPiece: func encode(with aCoder: NSCoder)")
        
        aCoder.encode(accessionNumber, forKey: Keys.AccessionNumber)
        aCoder.encode(lastName, forKey: Keys.LastName)
        aCoder.encode(firstName, forKey: Keys.FirstName)
        aCoder.encode(artistGender, forKey: Keys.ArtistGender)
        aCoder.encode(title, forKey: Keys.Title)
        aCoder.encode(year, forKey: Keys.Year)
        print("2")
        aCoder.encode(locationName, forKey: Keys.LocationName)
        aCoder.encode(latitude, forKey: Keys.Latitude)
        aCoder.encode(longitude, forKey: Keys.Longitude)
        aCoder.encode(address, forKey: Keys.Address)
        aCoder.encode(locationDescription, forKey: Keys.LocationDescription)
        print("3")
        aCoder.encode(isInterior, forKey: Keys.IsInterior)
        print("5")
        aCoder.encode(category.rawValue, forKey: Keys.Category)
        print("6")
        aCoder.encode(objectType, forKey: Keys.ObjectType)
        print("7")
        aCoder.encode(material, forKey: Keys.Material)
        print("8")
        aCoder.encode(materialDetails, forKey: Keys.MaterialDetails)
        print("9")
        aCoder.encode(size, forKey: Keys.Size)
        print("A")
        aCoder.encode(additionalDescription, forKey: Keys.AdditionalDescription)
        print("B")
        aCoder.encode(aboutTheWork, forKey: Keys.AboutTheWork)
        print("4")
    }
    
    required init(coder unarchiver: NSCoder) {
        print("ArtPiece: required init(coder unarchiver: NSCoder)")
        
        accessionNumber = unarchiver.decodeObject(forKey: Keys.AccessionNumber) as! String
        lastName = unarchiver.decodeObject(forKey: Keys.LastName) as? String
        firstName = unarchiver.decodeObject(forKey: Keys.FirstName) as? String
        artistGender = unarchiver.decodeObject(forKey: Keys.ArtistGender) as? String
        title = unarchiver.decodeObject(forKey: Keys.Title) as! String
        year = unarchiver.decodeObject(forKey: Keys.Year) as? String
        
        locationName = unarchiver.decodeObject(forKey: Keys.LocationName) as! String
        latitude = unarchiver.decodeObject(forKey: Keys.Latitude) as! Int
        longitude = unarchiver.decodeObject(forKey: Keys.Longitude) as! Int
        address = unarchiver.decodeObject(forKey: Keys.Address) as! String
        locationDescription = unarchiver.decodeObject(forKey: Keys.LocationDescription) as? String
        
        isInterior = unarchiver.decodeObject(forKey: Keys.IsInterior) as! Bool
        
        
        let rawCategory = unarchiver.decodeObject(forKey: Keys.Category) as? String
        let decodedCategory = Category(rawValue: rawCategory!)
        category = decodedCategory!

        
        //category = unarchiver.decodeObject(forKey: Keys.Category) as! Category
        objectType = unarchiver.decodeObject(forKey: Keys.ObjectType) as! String
        material = unarchiver.decodeObject(forKey: Keys.Material) as? String
        materialDetails = unarchiver.decodeObject(forKey: Keys.MaterialDetails) as? String
        size = unarchiver.decodeObject(forKey: Keys.Size) as? String
        additionalDescription = unarchiver.decodeObject(forKey: Keys.AdditionalDescription) as? String
        aboutTheWork = unarchiver.decodeObject(forKey: Keys.AboutTheWork) as? String
        
        //super.init()              //is this required??
        /*
        self.init(
            accessionNumber: accessionNumber,
            lastName: lastName,
            firstName: firstName,
            artistGender: artistGender,
            title :title,
            year: year,
            
            locationName: locationName,
            latitude: latitude,
            longitude: longitude,
            address: address,
            locationDescription: locationDescription,
            
            isInterior: isInterior,
            category: category,
            objectType: objectType,
            material: material,
            materialDetails: materialDetails,
            size: size,
            additionalDescription: additionalDescription,
            aboutTheWork: aboutTheWork
        )
         */
    }
}
