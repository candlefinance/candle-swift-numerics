// swift-tools-version:5.9
//===--- Package.swift ----------------------------------------*- swift -*-===//
//
// This source file is part of the Swift Numerics open source project
//
// Copyright (c) 2019-2025 Apple Inc. and the Swift Numerics project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import PackageDescription

let excludedFilenames = ["CMakeLists.txt", "README.md"]

let package = Package(

  name: "candle-swift-numerics",
  products: [
    .library(name: "CandleRealModule", targets: ["CandleRealModule"]),
  ],

  targets: [
    // MARK: - Public API
    .target(
      name: "CandleRealModule",
      dependencies: ["Candle_NumericsShims"],
      exclude: excludedFilenames,
      linkerSettings: [
        .linkedLibrary("m", .when(platforms: [.linux, .android]))
      ]
    ),

    // MARK: - Implementation details
    .target(
      name: "Candle_NumericsShims",
      exclude: excludedFilenames
    ),
  ]
)
