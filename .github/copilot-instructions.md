# Copilot Instructions for Church App

This repository is a Rails backend + SCSS frontend project with no frontend JavaScript framework. Use these instructions to keep generated code consistent with project conventions and RuboCop best practices.

## Project context
- Rails 8.x (or current stable) with MVC.
- SCSS-based styles in `app/assets/stylesheets`, structured by partials (base, components, layout, pages).
- ActiveRecord models and SQL-safe queries.
- RSpec for tests (`spec/`), plus request and model specs.
- Existing domain: `attendance_members`, `attendances`, `church_services`, `events`, `members`.

## Core Copilot behavior
- Follow idiomatic Rails patterns:
  - Skinny controllers, fat models (or service objects for complex logic).
  - POROs for business logic and reusable code.
  - Concerns for shared controller/model code.
- Operate only within this project folder (`/home/bookworm/Documents/final/church_app`). Do not access or modify files outside this directory without explicit permission.
- Always generate `params` whitelisting strong parameters in controllers.
- Avoid direct SQL string interpolation. Use `where` with named/scoped arguments and `find_by`.
- Use Rails helper methods in views (`form_with`, `link_to`, `content_tag`, `render` with partials).
- Use `t(...)` for text that should support I18n.
- Include appropriate database transactions around multi-step updates.

## SCSS conventions
- Use `@use`/`@forward` (if enabled) or structured `@import` with partial names.
- Keep nesting to max 3 levels.
- don't update global variables in `_variables.scss` without permission. Use properities from there.
- place shared mixins in `_mixins.scss`.
- Avoid inline styles in templates.

## RuboCop enforcement
- Generated code should pass `bundle exec rubocop`.
- Preferred metrics:
  - `Metrics/LineLength` <= 120
  - `Metrics/MethodLength` <= 15
  - `Metrics/BlockLength` <= 120
  - `Style/FrozenStringLiteralComment` enabled
- Use safe navigation (`&.`) and guard clauses.
- Use new hash syntax and frozen string literal where applicable.

## Testing requirements
- Add tests for all new behaviors:
  - model specs for validations and associations,
  - request specs for controller endpoints,
  - feature/system specs for UI flows (if relevant).
- Use shoulda-matchers for simple validation and association expectations.

## PR checklist (to include in templates)
- [ ] `bundle exec rubocop` passes.
- [ ] `bundle exec rspec` passes.
- [ ] `bin/rails db:migrate` and `bin/rails db:seed` run without errors in local env.
- [ ] SCSS layout inspected visually for regressions.
- [ ] No JS frameworks added; simple Rails stimulus usage only (if needed).
- [ ] Do not commit or push code without explicit owner permission (manual review step).

## Copilot generation annotations
For each generated snippet include these comments:
- `# Copilot: generated` at top of file or method.
- `# TODO: validate business rules` where domain logic is scaffolded and needs human confirmation.

## Example startup prompt (assistant preface)
"You are generating code for a Rails + SCSS app with structured stylesheets. Follow RuboCop and Rails style rules, keep controllers skinny, use strong params, and add tests alongside implementations."
