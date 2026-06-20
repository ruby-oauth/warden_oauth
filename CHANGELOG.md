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

- Added support for JRuby 10.1 and TruffleRuby 34.0.

### Changed

- Retemplated project metadata and CI/development automation with `kettle-jem` v7.0.0.

### Deprecated

### Removed

### Fixed

### Security

## [0.1.2] - 2026-06-15

- TAG: [v0.1.2][0.1.2t]
- COVERAGE: 96.84% -- 153/158 lines in 9 files
- BRANCH COVERAGE: 80.56% -- 29/36 branches in 9 files
- 53.12% documented

### Added

- Added a modern `kettle-jem` development harness, including Bundler setup,
  Appraisals, modular Gemfiles, binstubs, RuboCop Gradual, SimpleCov coverage,
  YARD documentation generation, release/support scripts, and local `mise`
  environment configuration.
- Added GitHub/GitLab CI coverage for MRI Ruby, JRuby, TruffleRuby, locked and
  unlocked dependencies, dependency heads, style checks, license checks, and
  template drift checks.
- Added generated project documentation and governance files, including
  Markdown README, CONTRIBUTING, FUNDING, SECURITY, CODE_OF_CONDUCT, license
  index, citation metadata, and published YARD docs.
- Added `Warden::OAuth::Version::VERSION` and `Warden::OAuth::VERSION` constants
  for the gem version.

### Changed

- Migrated the README from legacy RDoc to Markdown and restored the historical
  usage documentation in the template-managed Synopsis, Configuration, and Basic
  Usage sections.
- Documented the `rack-session` fork required by applications still running on
  Ruby 2.4 or Ruby 2.5.
- Modernized the test suite from the legacy RSpec 1/2 style runner and
  `should` expectations to RSpec 3.
- Tightened development dependency floors while preserving the oldest supported
  development workflows: `fakeweb` 1.3, `rack-test` 2.2, and `rspec` 3.13.
- Updated gem metadata, repository links, funding links, CI badges, and
  generated docs to use the `ruby-oauth/warden_oauth` repository and
  `ruby-oauth` Open Collective.
- Updated generated namespace references to use the real public namespace,
  `Warden::OAuth`, including README heading/badge, gemspec version loading,
  RBS signatures, and YARD docs.

### Removed

- Removed the legacy `README.rdoc`, `LICENSE.txt`, and RSpec `spec.opts` files
  in favor of the generated Markdown/license/spec harness.

### Fixed

- Fixed the Rack session spec setup for modern Rack by loading `rack-session`
  and using a Rack-compatible session secret.
- Fixed old-Ruby CI by using the `pboling/rack-session` old-Ruby fork only in
  the Ruby 2.4/2.5 appraisals.
- Fixed test compatibility with modern Ruby by shimming `File.exists?` for
  `fakeweb` during specs.

[Unreleased]: https://github.com/ruby-oauth/warden_oauth/compare/v0.1.2...HEAD
[0.1.2]: https://github.com/ruby-oauth/warden_oauth/compare/a38e5c5fb3d44936b48bb5e547ec7dd7f58530a3...v0.1.2
[0.1.2t]: https://github.com/ruby-oauth/warden_oauth/releases/tag/v0.1.2
