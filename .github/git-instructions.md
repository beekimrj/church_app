# Git Workflow Instructions

**🚨 CRITICAL: Never push code without explicit BM confirmation - always wait for approval before running `git push`**

This document provides guidelines for git operations and commit conventions for this project.

## Commit Message Convention

Commit messages are prefixed with author initials to clearly distinguish between human and AI contributions.

### Format

```
<PREFIX>: <type>: <description>
```

### Prefix Types

**BM: (Human Commits)**
- Used for commits made by the primary developer (BM)
- Format: `BM: <type>: <description>`
- Examples:
  - `BM: feat: add member search functionality`
  - `BM: fix: resolve attendance validation error`
  - `BM: refactor: extract service object`

**AI: (AI-Generated Commits)**
- Used for commits made by AI assistant
- Format: `AI: <type>: <description>`
- Examples:
  - `AI: feat: add dashboard component`
  - `AI: fix: correct SCSS compilation error`
  - `AI: test: add model specs`

### Commit Type

After the prefix, specify the type of change:

- **feat**: A new feature
- **fix**: A bug fix
- **refactor**: Code refactoring without behavior change
- **test**: Adding or updating tests
- **docs**: Documentation updates
- **style**: Code style changes (formatting, RuboCop, etc.)
- **perf**: Performance improvements
- **chore**: Build, dependency, or tooling changes

### Description Guidelines

- Use imperative mood ("add" not "added" or "adds")
- Don't capitalize first letter after the type
- No period at the end
- Keep first line under 50 characters (with prefix and type)
- If needed, add detailed explanation in the body (separated by blank line)

### Examples

#### Short commit messages
```
BM: feat: add member authentication
AI: fix: correct form validation logic
BM: docs: update API documentation
AI: test: add integration specs
```

#### Commit with body
```
BM: feat: implement email notifications

- Add email service for member updates
- Configure SMTP settings
- Add mailer tests
- Update member model with notifications flag
```

## Branch Naming Conventions

Branch names should be descriptive and follow this pattern:

```
<type>/<feature-name>
```

### Types

- `feature/` - New features
- `bugfix/` - Bug fixes
- `hotfix/` - Emergency production fixes
- `refactor/` - Code refactoring
- `test/` - Test additions or fixes
- `docs/` - Documentation updates

### Examples

```
feature/add-attendance-report
bugfix/fix-member-search
refactor/extract-common-logic
docs/update-readme
hotfix/resolve-critical-bug
```

### Guidelines

- Use lowercase and hyphens (no underscores or spaces)
- Keep branch names concise but descriptive
- Include issue number if applicable: `feature/add-notifications-#123`

## Pull Request Workflow

### PR Title Format

Use the same prefix convention with type information:

```
BM: <type>: <description>
AI: <type>: <description>
```

### PR Description Template

```
## Description
Brief explanation of changes

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] Refactoring
- [ ] Documentation

## Testing
Describe testing performed

## Checklist
- [ ] Code follows project style guidelines
- [ ] RuboCop passes (`bundle exec rubocop`)
- [ ] Tests pass (`bundle exec rspec`)
- [ ] No new security issues (Brakeman)
- [ ] Documentation updated
- [ ] Commits follow naming convention
```

## Commit History Best Practices

### Good Practices

1. **Logical commits**: Group related changes together
2. **Atomic commits**: Each commit should be independently functional
3. **Descriptive messages**: Clear explanation of what and why
4. **Small, focused PRs**: Easier to review and understand
5. **Clean history**: Avoid unnecessary merge commits

### Before Committing

```bash
# Review changes
git status
git diff [filename]

# Check for staged changes
git diff --cached

# Verify code quality before commit
bundle exec rubocop
bundle exec rspec
```

### Interactive Rebase

For cleaning up commit history before pushing:

```bash
# Rebase last N commits
git rebase -i HEAD~N

# Commands in rebase:
# p = pick (use commit)
# r = reword (use commit, but edit message)
# s = squash (use commit, but meld into previous)
# d = drop (remove commit)
```

## Important Reminders

### ⚠️ Never Commit or Push Without Permission

- **Always review changes before committing** to your feature branch
- **Never commit or push directly to `main` or any shared branch** without explicit confirmation
- **Always get approval before pushing** - even to your feature branch if working with others
- **Manual review step required** before any push to production/main
- **Wait for BM confirmation** before pushing AI-generated code

### Push Safety Checklist

Before pushing any code:

```bash
# 1. Check what you're about to push
git log origin/<branch>..<branch>

# 2. Review all changes
git diff origin/<branch>

# 3. Verify tests pass
bundle exec rspec
bundle exec rubocop

# 4. Double-check branch name
git rev-parse --abbrev-ref HEAD

# 5. Get explicit confirmation before proceeding
# Push only after receiving "yes, go ahead" from BM

# 6. Push when approved
git push origin <branch>
```

### Author Attribution

Proper author attribution helps maintain clear project history:

- **BM commits**: Your manual work and decisions
- **AI commits**: AI-assisted generation with your approval
- **Mixed work**: Use the initiator's prefix (who made the commitment)

## Undoing Changes

### Before Commit (Staged Changes)

```bash
# Unstage a file
git reset HEAD <filename>

# Discard changes in working directory
git checkout -- <filename>

# Discard all changes
git reset --hard HEAD
```

### After Commit (Not Pushed)

```bash
# Amend last commit
git commit --amend

# Undo last commit, keep changes staged
git reset --soft HEAD~1

# Undo last commit, discard changes
git reset --hard HEAD~1
```

### After Push (Use with Caution)

```bash
# Revert a commit (creates new commit)
git revert <commit-hash>

# Only if not yet pulled by others:
git push --force-with-lease origin <branch>
```

## Merge vs Rebase

### Merge (Default)
```bash
# Creates merge commit
git merge <branch>
```

**Use when:**
- Merging to production
- Working with shared branches
- Want to preserve integration history

### Rebase (Clean History)
```bash
# Replay commits on top of target branch
git rebase <branch>
```

**Use when:**
- Before pushing feature branch
- Keeping personal branches up-to-date
- Want linear commit history

## Viewing Commit History

```bash
# Display commits in one line
git log --oneline

# Show commits with all branches
git log --graph --all --decorate --oneline

# Show commits by author
git log --author="BM" --oneline
git log --author="AI" --oneline

# Show commits since date
git log --since="2 weeks ago" --oneline

# Show changes in specific file
git log -p <filename>
```

## Useful Git Aliases

Add to `~/.gitconfig` or `.git/config`:

```ini
[alias]
  st = status
  co = checkout
  br = branch
  ci = commit
  unstage = reset HEAD --
  last = log -1 HEAD
  visual = log --graph --oneline --all --decorate
  bm-log = log --author=BM --oneline
  ai-log = log --author=AI --oneline
```

Usage:
```bash
git st          # Same as git status
git bm-log      # Shows all BM commits
git ai-log      # Shows all AI commits
git visual      # Pretty commit graph
```

---

**Remember**: Clear, consistent commit history makes code reviews easier and project maintenance more straightforward.
