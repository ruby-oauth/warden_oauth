# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## 0.1.1 (Feb 1, 2010)

* Given the warden API was updated, the redirect! method would not work
without invoking a throw(:warden) [contributor: eoin]

## 0.1.0 (Jan 9, 2010) Lets stay up to date with josevalim's work

* Renaming the warden_oauth/manager.rb to warden_oauth/config_extension.rb,
given that the Warden::Manager is not the given instance on the
Warden::Manager block anymore
* Creating a new way to assign access_token_user_finders to the strategies,
using the sole strategy had a drawback, the class was lazily created after the
first request to the Rack middleware.
* Added an example of a twitter client (given that's the more popular client
being used)
* Update of the README

## 0.0.2 (Oct 1, 2009) Keep the manager out of the business of strategies

* Removing the access_token_user_finder from Warden::Manager and adding it to
the Warden::StrategyBuilder module

## 0.0.1 (Sep 16, 2009) The beginning of easy OAuth for Warden

* Adding the initial implementation of the warden_oauth gem
