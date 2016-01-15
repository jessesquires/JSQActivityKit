# JSQActivityKit

[![Build Status](https://secure.travis-ci.org/jessesquires/JSQActivityKit.svg)](http://travis-ci.org/jessesquires/JSQActivityKit) [![Version Status](https://img.shields.io/cocoapods/v/JSQActivityKit.svg)][podLink] [![license MIT](https://img.shields.io/cocoapods/l/JSQActivityKit.svg)][mitLink]  [![Platform](https://img.shields.io/cocoapods/p/JSQActivityKit.svg)][docsLink] [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Swift UIActivities for iOS*

## About

A Swift framework of [`UIActivity`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActivity_Class/index.html) classes for sharing and performing actions with [`UIActivityViewController`](http://nshipster.com/uiactivityviewcontroller/).

Current activities:

* Safari
* Instagram

## Requirements

* iOS 8+
* Swift 2.0

## Installation

#### [CocoaPods](http://cocoapods.org) (recommended)

````ruby
use_frameworks!

# For latest release in cocoapods
pod 'JSQActivityKit'

# Feeling adventurous? Get the latest on develop
pod 'JSQActivityKit', :git => 'https://github.com/jessesquires/JSQActivityKit.git', :branch => 'develop'
````

#### [Carthage](https://github.com/Carthage/Carthage)

````bash
github "jessesquires/JSQActivityKit"
````

## Documentation

Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

More information on the [gh-pages](https://github.com/jessesquires/JSQActivityKit/tree/gh-pages) branch.

## Getting Started

````swift
import JSQActivityKit
````

See the included example app, open `JSQActivityKit.xcworkspace`.

## Contribute

Please follow these sweet [contribution guidelines](https://github.com/jessesquires/HowToContribute).

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

`JSQActivityKit` is released under an [MIT License][mitLink]. See `LICENSE` for details.

>**Copyright &copy; 2015 Jesse Squires.**

*Please provide attribution, it is greatly appreciated.*

[docsLink]:http://www.jessesquires.com/JSQActivityKit
[podLink]:https://cocoapods.org/pods/JSQActivityKit
[mitLink]:http://opensource.org/licenses/MIT
