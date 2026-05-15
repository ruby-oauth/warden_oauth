# Incident Response Plan (IRP)

Status: Draft

## Purpose

This Incident Response Plan (IRP) defines the steps maintainers will follow when handling security incidents related to the `warden_oauth` gem.

## Scope

Applies to incidents affecting the `warden_oauth` codebase, releases, CI/CD or publishing infrastructure related to the gem, repository credentials, or compromises that could affect users.

## Key assumptions
- This project may be maintained by a small number of maintainers.
- Public vulnerability disclosure is handled via Tidelift (see `SECURITY.md`).
- The maintainer handling the issue acts as incident coordinator unless delegated.

## Contact & Roles

- Incident Coordinator: primary maintainer / repo owner
- Secondary Contact: trusted collaborator if available

## Incident Handling Workflow
1. Identification & Reporting
   - Reports may arrive via Tidelift, issue tracker, direct email, or third-party advisories.
   - Acknowledge receipt promptly.

2. Triage & Initial Assessment
   - Determine affected versions, exploitability, and likely impact.
   - Reproduce locally where possible.
   - Check whether session/auth bypass, callback misuse, token leakage, or configuration mistakes are involved.

3. Containment & Mitigation
   - Document temporary mitigations or safer configuration guidance if available.
   - If credentials or release infrastructure may be compromised, rotate them immediately.

4. Remediation & Patch
   - Prepare a minimal, tested fix.
   - Add regression coverage.
   - Prefer patch-safe changes unless a larger semver event is required.

5. Release & Disclosure
   - Coordinate disclosure timing through Tidelift.
   - Publish a release and update changelog/release notes with non-sensitive detail.

6. Post-Incident
   - Record a short postmortem.
   - Add tests/process updates to reduce recurrence.

## Threats worth keeping in view
- authentication bypass or misbinding of users to OAuth credentials
- callback / redirect handling mistakes
- access token leakage
- request-token or access-token misuse in failure flows
- compromised gem release credentials or CI secrets

## Maintainer Checklist
- [ ] Acknowledge the report
- [ ] Reproduce and classify severity
- [ ] Prepare and test a fix
- [ ] Coordinate disclosure through Tidelift
- [ ] Publish release and advisory
- [ ] Capture follow-up actions
