//
//  DetailScreenPresenterTests.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 13/05/2018.
//  Copyright (c) 2018 Carles Grau Galvan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Marvel_App
import XCTest
import Kingfisher

class DetailScreenPresenterTests: XCTestCase {
  // MARK: Subject under test

  var sut: DetailScreenPresenter!

  // MARK: Test lifecycle

  override func setUp() {
    super.setUp()
    setupDetailScreenPresenter()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: Test setup

  func setupDetailScreenPresenter() {
    sut = DetailScreenPresenter()
  }

  // MARK: Test doubles

  class DetailScreenDisplayLogicSpy: DetailScreenDisplayLogic {
    var displayCharacterCalled = false
    var setupComicCalled = false
    var setupSerieCalled = false
    var setupEventCalled = false

    func displayCharacter(viewModel: DetailScreen.SelectedCharacter.ViewModel) {
        displayCharacterCalled = true
    }

    func setupComicCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        setupComicCalled = true
    }

    func setupSerieCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        setupSerieCalled = true
    }

    func setupEventCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        setupEventCalled = true
    }
  }

  // MARK: Tests

  func testPresentCharacter() {
    // Given
    let charMock = Mock.CharacterMock()
    let venom = charMock.venom
    let spy = DetailScreenDisplayLogicSpy()
    sut.viewController = spy
    let response = DetailScreen.SelectedCharacter.Response(name: venom.name, thumbnailResource: charMock.imageResource, description: venom.description)

    // When
    sut.presentCharacter(response: response)

    // Then
    XCTAssertTrue(spy.displayCharacterCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}