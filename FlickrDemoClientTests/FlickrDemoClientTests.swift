//
//  FlickrDemoClientTests.swift
//  FlickrDemoClientTests
//
//  Created by Рабочий on 02/02/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import XCTest
@testable import FlickrDemoClient

class FlickrDemoClientTests: XCTestCase {

    func testPackagesIsNotNil() {
        let modulesCoordinator = ModulesCoordinator()
        let packageBuilder = ControllerPackageBuilder(modulesCoordinator: modulesCoordinator)
        let gallery = packageBuilder.createPackage(type: .gallery)
        XCTAssertNotNil(gallery, "gallery package created - nil")
        let photoInfo = packageBuilder.createPackage(type: .photoInfo)
        XCTAssertNotNil(photoInfo, "photoInfo package created - nil")
        let favourites = packageBuilder.createPackage(type: .favourites)
        XCTAssertNotNil(favourites, "favourites package created - nil")
    }

    func testDownloadFlickrData() {
        let internetService = InternetService()
        
        let expectation = XCTestExpectation(description: "Download list of images from flickr")
        
        let url = URL(string: "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=40&page=1&format=json&nojsoncallback=1&extras=url_l&date=2018-09-23")
        internetService.loadData(fromURL: url, parseInto: FlickrResponse.self, success: { (response: FlickrResponse) in
            XCTAssertNotNil(response, "Flickr response - nil")
            expectation.fulfill()
        }) { (code) in
            XCTFail()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
