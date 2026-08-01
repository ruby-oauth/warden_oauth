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

- kettle-jem-template-20260720-001 - READMEs can now display configured
  corporate sponsor logos.
- kettle-jem-template-20260720-005 - README Support & Community links now
  include RubyForum.
- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.
- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.
- kettle-jem-template-20260729-005 - Gemspec metadata now publishes this
  project's RubyForum tag as `mailing_list_uri`, and support docs link to the
  tagged RubyForum community alongside Discord.

### Changed

- kettle-jem-template-20260716-001 - Shim gemspec manifests now include
  `LICENSE.md` instead of nonexistent `LICENSE.txt`.
- kettle-jem-template-20260716-002 - Generated gemspec manifests now ship fewer
  repository-only files by default to reduce downstream distro packaging churn.

- kettle-jem-template-20260720-002 - Development Gemfiles now use the released
  `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260725-002 - Version specs now use `anonymous_loader` to
  cover `version.rb` without redefining constants, or are removed when version
  specs are not managed for the project.
- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.

### Deprecated

### Removed

### Fixed

- kettle-jem-template-20260720-003 - StructuredMerge Git diff driver config now
  uses the installed `smorg-rb` driver command.
- kettle-jem-template-20260720-004 - MRI-only projects now omit JRuby and
  TruffleRuby workflow jobs.
- kettle-jem-template-20260725-001 - Release pull request branches beginning
  with `feature/release` now run JRuby and TruffleRuby workflows.
- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.
- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.
- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.
- kettle-jem-template-20260728-005 - VersionGem bootstrap now creates the
  missing canonical version spec when a project only has shim namespace version
  specs.
- kettle-jem-template-20260729-001 - Generated JRuby 9.4 workflows now use the
  legacy manual bundle install path, avoiding setup-time Bundler full-index
  failures against `gem.coop`.
- kettle-jem-template-20260729-002 - VersionGem bootstrap now preserves
  and templates dedicated `version_gem.rb` entrypoints even when the gemspec
  dependency is intentionally omitted, and generated anonymous-loader specs
  cover both `version.rb` and `version_gem.rb`.
- kettle-jem-template-20260729-003 - Old-Ruby gems below the VersionGem runtime
  floor now get managed minimal `version.rb` files and anonymous-loader version
  specs without adding `version_gem`.
- kettle-jem-template-20260730-001 - Gemspec package file enumeration now runs
  relative to the gemspec directory, so release package contents stay correct
  even when the gemspec is loaded from another working directory.

### Security

## [0.1.3] - 2026-07-15

- TAG: [v0.1.3][0.1.3t]
- COVERAGE: 96.84% -- 153/158 lines in 9 files
- BRANCH COVERAGE: 80.56% -- 29/36 branches in 9 files
- 53.12% documented

### Added

- Added support for JRuby 10.1 and TruffleRuby 34.0.

### Changed

- Retemplated project metadata and CI/development automation with `kettle-jem` v7.0.0.

### Fixed

- Package configured license files in gem release file lists.

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

[Unreleased]: https://github.com/ruby-oauth/warden_oauth/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/ruby-oauth/warden_oauth/compare/v0.1.2...v0.1.3
[0.1.3t]: https://github.com/ruby-oauth/warden_oauth/releases/tag/v0.1.3
[0.1.2]: https://github.com/ruby-oauth/warden_oauth/compare/a38e5c5fb3d44936b48bb5e547ec7dd7f58530a3...v0.1.2
[0.1.2t]: https://github.com/ruby-oauth/warden_oauth/releases/tag/v0.1.2
