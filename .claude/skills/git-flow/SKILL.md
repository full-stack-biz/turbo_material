---
name: git-flow
description: >-
  Branch, release and hotfix the turbo_material gem with git-flow-next (git flow 2.x): feature and
  bugfix branches from develop, release/vX.Y.Z from develop into main tagged vX.Y.Z, hotfix/vX.Y.Z
  from main; pushing main publishes the gem to RubyGems. Use when asked to "release", "cut a
  release", "publish the gem", "tag a version", "bump the version", "hotfix", "start a feature",
  "git flow", "finish the release", or to commit or merge to main or develop.
---

# git-flow (git-flow-next) in turbo_material

`main` has only releases: each commit on it is a release or hotfix merge, tagged `vX.Y.Z`.
`develop` is the development branch. Never commit to `main` directly.

A push to `main` triggers `.github/workflows/gem-push.yml`, which runs `gem build` and `gem push`
to rubygems.org with the `RUBYGEMS_AUTH_TOKEN` secret, on a GitHub-hosted runner: the org's
self-hosted runner groups don't serve public repositories, and v0.3.4's run sat queued on
`self-hosted` until cancelled. Pushing `main` is publishing the gem:
a published version cannot be re-used, so a fix is the next version. Host apps (lite-crm,
full_stack_biz) pick it up with `bundle update turbo_material`.

Remote: `origin` = `git@github.com:full-stack-biz/turbo_material.git`.

## Check the tool first

```bash
git flow version          # must print "2.1.0 (git-flow-next)", not 0.4.1
git flow config list      # develop → main with "Auto-update: enabled"
```

Homebrew installs both `git-flow` (0.4.1, nvie) and `git-flow-next` as the binary `git-flow`.
When `git flow version` prints 0.4.1, stop and tell the operator: `brew unlink git-flow && brew link git-flow-next`.

The `v` is part of the name given to `start`: `git flow release start v0.3.4` makes
`release/v0.3.4` and tags `v0.3.4`. The tag is the gem version with a `v`. Gem 0.3.1–0.3.3 were
mistagged `v0.30.1`–`v0.30.3` (and 0.3.0 has both `v0.3.0` and `v0.30.0`); those tags stay, but
never add another `v0.30.x`: `v0.30.3` sorts above `v0.3.4`, so read the latest version from
`lib/turbo_material/version.rb` on `main`, not from `git tag`.

## Release

The operator names the version; by default it is the next patch after the version on `main`. Do
every step only when the operator asks for it.

```bash
git switch develop
bundle exec rake test                      # must pass before starting
bundle exec rubocop                        # must pass before starting
git flow release start vX.Y.Z --no-fetch
# on the release branch, in one commit: VERSION = 'X.Y.Z' in lib/turbo_material/version.rb,
# `bundle install` (Gemfile.lock's PATH section carries the version), and CHANGELOG.md's
# "## vX.Y.Z" section
git flow release finish vX.Y.Z --no-fetch -m "vX.Y.Z <summary>"
```

What a release changes:

| File | At a release |
|---|---|
| `lib/turbo_material/version.rb` | `VERSION = 'X.Y.Z'`; the only version in the source |
| `Gemfile.lock` | `turbo_material (X.Y.Z)` under `PATH`, from `bundle install` |
| `CHANGELOG.md` | a `## vX.Y.Z` section above the previous one, a list of `- ` lines |

The entries come from the diff, not from commit subjects: `git diff --stat=200 main..release/vX.Y.Z -- app config lib turbo_material.gemspec`,
then the diff of each commit that touches those files. Write entries as what a host app sees: a
changed helper option, a new component, a dependency range, and for a fix what failed before. A
test-only, docs-only or skill-only commit is not an entry. The tag message is `vX.Y.Z <summary>`.

`finish` merges release/vX.Y.Z into main, tags `vX.Y.Z` on main, merges main into develop
(auto-update), and deletes the release branch. It does not push. Then, only when the operator says
push:

```bash
git push origin main develop vX.Y.Z    # one git command: the branches and the tag together
```

After it, check: `git tag -n1 vX.Y.Z` (on main's merge commit), `git merge-base --is-ancestor vX.Y.Z develop`.
Then tell the operator the tag is pushed and the Ruby Gem run started, and check the gem appears:
`gem list turbo_material --remote --exact`.

The gemspec sets `rubygems_mfa_required`. If the Ruby Gem run fails asking for an OTP, the token
cannot push alone: the operator pushes from a local build (`gem build turbo_material.gemspec`,
then `gem push turbo_material-X.Y.Z.gem` with their code). Never pass an OTP yourself.

## Hotfix

```bash
git flow hotfix start vX.Y.Z --no-fetch    # from main
# fix; run the checks above; then version.rb, bundle install, CHANGELOG section; commit
git flow hotfix finish vX.Y.Z --no-fetch -m "vX.Y.Z <summary>"
```

Uncommitted changes on `main` carry over to the hotfix branch on `start`; commit them there.

## Feature or bugfix

```bash
git flow feature start <name> --no-fetch    # from develop
git flow feature finish <name> --no-fetch   # merges into develop, no tag
git flow bugfix start <name> --no-fetch     # same, bugfix/ prefix
```

## Rules

| Rule | Why |
|---|---|
| Do not commit, tag, push or finish without the operator's request | global CLAUDE.md |
| No `Co-Authored-By` trailer in commits | operator's rule |
| Pushing `main` publishes the gem: push only when the operator says push | a RubyGems version is permanent |
| A git write command runs alone, without a pipe | operator's rule |
| Tests and RuboCop pass before a release or hotfix finishes; there are no git hooks to run them | no CI runs them |
| Every version change goes in the release commit, never after the tag | the gem built from main carries version.rb as merged |
| Never `git merge` main into develop by hand after a finish | auto-update did it |
| Tag `vX.Y.Z`, never `v0.30.x` style | the tag must match the gem version |

`finish` checks that the topic branch and its parent are not behind or diverged from origin; it
fails otherwise. `--force` skips the check: do not pass it without the operator.
