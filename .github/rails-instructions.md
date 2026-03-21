# Rails Development Instructions

This document provides comprehensive guidelines for developing Rails applications. Always adapt these patterns to your project's specific requirements.

## ⚠️ IMPORTANT: Always Understand the Current Codebase First

**Before making any changes, always begin by exploring and understanding the entire project structure:**

1. **Read all model files** to understand current relationships and business logic
2. **Review controller actions** to understand current functionality
3. **Check existing views and partials** for UI patterns
4. **Examine current SCSS structure** and design system
5. **Review tests** to understand expected behavior
6. **Check routes** for current API structure

**Never assume the codebase matches these examples** - always verify current implementation before proceeding.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture & Design Principles](#architecture--design-principles)
3. [Ruby/Rails Development Guidelines](#rubyruby-development-guidelines)
4. [SCSS/Styling Guidelines](#scssstyling-guidelines)
5. [Component Library](#component-library)
6. [Testing Guidelines](#testing-guidelines)
7. [Code Quality & Standards](#code-quality--standards)
8. [Development Workflow](#development-workflow)

## Project Overview

### Domain Model Pattern

Church management systems typically follow a hierarchical structure:

```
Member → Attendance Records → Events → Church Services
```

**Common Entity Types:**
- **Members**: Church attendees with personal/contact information
- **Events**: Church services, meetings, or activities
- **Attendance**: Records of member participation in events
- **Services/Groups**: Organizational units (Adult Service, Sunday School, etc.)

### Tech Stack

- **Backend**: Rails (latest stable version), PostgreSQL
- **Frontend**: Hotwire (Turbo + Stimulus), Slim templates, SCSS
- **Testing**: RSpec, FactoryBot, Shoulda-Matchers
- **Code Quality**: RuboCop, Brakeman
- **Deployment**: Kamal, Docker

## Architecture & Design Principles

### SOLID Principles

**Single Responsibility Principle (SRP)**
- Each class/method should have one reason to change
- Controllers handle HTTP requests/responses only
- Models handle data persistence and business logic
- Services handle complex business operations
- Views handle presentation logic

**Open/Closed Principle (OCP)**
- Classes should be open for extension, closed for modification
- Use inheritance, composition, and mixins appropriately
- Design for extensibility (e.g., configurable service types)

**Liskov Substitution Principle (LSP)**
- Subtypes must be substitutable for their base types
- Maintain consistent interfaces across inheritance hierarchies

**Interface Segregation Principle (ISP)**
- Clients should not be forced to depend on interfaces they don't use
- Create specific interfaces for different client needs
- Use Ruby modules for mixin-based interfaces

**Dependency Inversion Principle (DIP)**
- High-level modules should not depend on low-level modules
- Both should depend on abstractions
- Use dependency injection and service objects

### DRY (Don't Repeat Yourself)

- Extract common logic into:
  - Concerns for shared model/controller behavior
  - Service objects for business logic
  - Helper methods for view logic
  - Partial templates for repeated UI elements
  - SCSS mixins for repeated styles

### Rails Conventions

- Follow Rails MVC pattern strictly
- Use RESTful routing and resource-based controllers
- Implement proper strong parameters
- Use ActiveRecord associations and scopes effectively
- Leverage Rails helpers and conventions

## Ruby/Rails Development Guidelines

### Model Design Patterns

**Basic Model Structure:**
```ruby
class Member < ApplicationRecord
  # Associations (verify current relationships first)
  # has_many :attendances, dependent: :destroy

  # Validations (check existing validation rules)
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true

  # Scopes (review existing scopes)
  # scope :active, -> { where(active: true) }

  # Instance methods
  # def full_name
  #   "#{first_name} #{last_name}"
  # end
end
```

**Always check existing models first:**
```bash
# Review current model structure
cat app/models/*.rb
# Check associations and validations
grep -r "belongs_to\|has_many\|validates" app/models/
```

### Controller Design Patterns

**RESTful Controller Template:**
```ruby
class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  def index
    # Check existing implementation first
    @members = Member.all # or existing scope/query
  end

  def show
    # Member details
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: "Member was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # ... other actions

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    # Always check existing strong parameters first
    params.require(:member).permit(:name, :email) # adjust based on current model
  end
end
```

**Before modifying controllers:**
```bash
# Check current controller structure
cat app/controllers/*_controller.rb
# Review existing actions and parameters
grep -A 5 "def " app/controllers/*_controller.rb
```

  def index
    @members = Member.search(params[:search]).ordered.page(params[:page])
  end

  def show
    # Member details with associated data
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: "Member was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Edit form
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: "Member was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: "Member was successfully destroyed."
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(
      :first_name, :last_name, :email, :phone_number,
      :date_of_birth, :baptism_date, :code, :gender, :marital_status
    )
  end
end
```

**Strong Parameters Patterns:**
```ruby
# Basic parameters
def member_params
  params.require(:member).permit(:first_name, :last_name, :email, :phone_number)
end

# Nested parameters
def event_params
  params.require(:event).permit(
    :name, :status, :start_date, :end_date, :church_service_id,
    :code, :description, :recurrence, :capacity,
    :default_start_time, :default_end_time
  )
end

### Service Objects

**Business Logic Extraction Pattern:**
```ruby
# app/services/attendance_service.rb
class AttendanceService
  include ActiveModel::Validations

  def initialize(resource)
    @resource = resource
  end

  def perform_action
    # Business logic here
    # Check existing similar services first
  end

  private

  def validate_business_rules
    # Custom validation logic
  end
end
```

**When to create services:**
- Complex multi-step operations
- External API integrations
- Business rule validations
- Data import/export operations

### Query Objects

**Complex Query Pattern:**
```ruby
# app/queries/attendance_report_query.rb
class AttendanceReportQuery
  def initialize(filters = {})
    @filters = filters
  end

  def call
    # Build query based on current model relationships
    # Always verify table structure first
  end
end
```
### Concerns

**Shared Controller/Model Logic:**
```ruby
# app/controllers/concerns/concern_name.rb
module ConcernName
  extend ActiveSupport::Concern

  included do
    # Callbacks and helper methods
    helper_method :helper_method_name
  end

  def shared_method
    # Shared implementation
  end
end
```

**Common Concerns:**
- Paginatable (page/per_page handling)
- Searchable (search filtering)
- Sortable (sort ordering)
- Filterable (advanced filtering)
- Trackable (created_by, updated_by)

**Usage:**
```ruby
class MembersController < ApplicationController
  include Paginatable
  include Searchable

  def index
    @members = apply_search(Member.all, search_params).ordered.page(page_number).per(per_page)
  end
end
```

### Query Objects

**Complex Query Logic:**
```ruby
# app/queries/attendance_report_query.rb
class AttendanceReportQuery
  def initialize(start_date: nil, end_date: nil, church_service_id: nil)
    @start_date = start_date
    @end_date = end_date
    @church_service_id = church_service_id
  end

  def call
    AttendanceMember
      .joins(attendance: [:event])
      .where(build_conditions)
      .group('events.name')
      .count
  end

  private

  def build_conditions
    conditions = {}
    conditions[:attendances] = { date: @start_date..@end_date } if date_range?
    conditions[:events] = { church_service_id: @church_service_id } if @church_service_id
    conditions
  end

  def date_range?
    @start_date && @end_date
  end
end
```

### Form Objects

**Form Objects Pattern:**
```ruby
# app/forms/form_name.rb
class FormName
  include ActiveModel::Model
  include ActiveModel::Attributes

  # Define form attributes
  attribute :field_name, :string

  # Add validations based on form requirements
  validates :field_name, presence: true

  def save
    return false unless valid?
    # Implement object creation/update logic
    true
  end
end
```

**When to use form objects:**
- Complex forms with multiple models
- Custom validation logic
- Multi-step form processes
- Form data transformation before persistence

## SCSS/Styling Guidelines

### CSS Variables (Design Tokens)

**Always check current variables first:**
```bash
# Review existing design tokens
cat app/assets/stylesheets/config/_variables.scss
```

**Pattern - Define custom properties for:**
- Typography (families, sizes, line-heights)
- Color system (primary, secondary, semantic colors)
- Spacing scale (xs, s, m, l, xl, etc.)
- Component colors (buttons, forms, states)
- Effects (shadows, borders, radius)

**Example structure:**
```scss
--font-family-sans: /* your font stack */;
--color-primary: /* your brand color */;
--space-m: /* your base spacing */;
/* ... more tokens ... */
```

### SCSS Architecture

**Always review current structure:**
```bash
# Check existing SCSS organization
find app/assets/stylesheets -name "*.scss" | head -20
# Review import order
cat app/assets/stylesheets/application.sass.scss
```

**File Structure Pattern:**
```
stylesheets/
├── application.sass.scss     # Main entry - check imports
├── config/                   # Design tokens - review variables
├── mixins/                   # Reusable logic - check existing
├── components/              # UI components - review patterns
├── layouts/                 # Page layouts - check current
└── utilities/               # Helpers - review utilities
```

### Component Patterns

**Always review current component implementations:**
```bash
# Check existing component styles
find app/assets/stylesheets/components -name "*.scss"
# Review how components are structured
cat app/assets/stylesheets/components/_*.scss | head -50
```

**Component Pattern:**
```scss
// components/_component-name.scss
.component-name {
  // Base styles using CSS variables
  property: var(--variable-name);
  // Responsive variations using mixins
  @include media.media(breakpointName) {
    // Responsive property changes
  }
}

// Variants
.component-name--variant {
  // Override specific properties
}
```

**Components to organize:**
- Buttons (primary, secondary, danger variants)
- Forms (inputs, selects, validation states)
- Tables (responsive, sorting, pagination)
- Cards (content containers)
- Navigation (headers, menus, breadcrumbs)
- Alerts/Notifications (success, warning, danger)
- Modals/Overlays
- Badges/Tags

### Responsive Design Patterns

**Mobile-first approach:**
```scss
.my-layout {
  // Mobile (default) styles
  display: block;

  // Apply breakpoints for larger screens
  @include media.media(tabletAndUp) {
    display: grid;
  }
}
```

**Check current breakpoints:**
```bash
# Review defined media query mixins
cat app/assets/stylesheets/mixins/_media.scss
```

## Component Library

### Always Check Existing Components First

**Review current implementation:**
```bash
# Check existing helper methods
cat app/helpers/*_helper.rb
# Review current partials
find app/views -name "_*.html.slim" | head -10
# Check for shared components
find app/views/shared -name "_*.html.slim"
```

**Helper Method Skeleton:**
```ruby
module ApplicationHelper
  # Check existing helpers first
  def component_helper(param, options = {})
    # Implementation based on current patterns
  end
end
```

**Partial Template Skeleton:**
```slim
.component-class
  - if condition
    h1= @variable
  // Review existing partials for current patterns
```

## Testing Guidelines

### Always Review Existing Tests First

**Check current test structure:**
```bash
# Review existing specs
find spec -name "*.rb" | wc -l
grep -r "describe\|context\|it " spec | head -20
# Check factory definitions
cat spec/factories/*.rb | head -20
# Review test helpers
cat spec/rails_helper.rb spec/spec_helper.rb
```

**Model Spec Skeleton:**
```ruby
# spec/models/model_name_spec.rb
RSpec.describe ModelName, type: :model do
  # Check current model specs for patterns
  describe 'validations' do
    # Add validations based on model
  end

  describe 'associations' do
    # Add associations based on model
  end

  describe 'scopes' do
    # Add scopes based on model
  end
end
```

**Controller Spec Skeleton:**
```ruby
# spec/requests/models_spec.rb
RSpec.describe 'Models', type: :request do
  # Check existing controller specs for patterns
end
```

**Factory Skeleton:**
```ruby
# spec/factories/models.rb
FactoryBot.define do
  factory :model_name do
    # Define attributes based on current implementation
  end
end
```

## Code Quality & Standards

### Code Quality Tools

**Always check current configuration:**
```bash
# Review RuboCop rules
cat .rubocop.yml
# Check Brakeman security scan
bundle exec brakeman
# Run RuboCop
bundle exec rubocop
```

### Code Review Checklist

**Ruby/Rails:**
- [ ] Follows SOLID principles
- [ ] DRY - no code duplication
- [ ] Strong parameters implemented
- [ ] Proper error handling
- [ ] Database transactions for multi-step operations
- [ ] Appropriate use of concerns/services
- [ ] Tests written and passing

**SCSS:**
- [ ] Uses design tokens (CSS variables)
- [ ] Follows component architecture
- [ ] Responsive design implemented
- [ ] No magic numbers
- [ ] Proper nesting (max 3 levels)

**General:**
- [ ] RuboCop passes
- [ ] Brakeman security scan passes
- [ ] Tests pass
- [ ] No console errors
- [ ] Accessible markup
- [ ] Mobile-friendly

### Git Workflow

**Branch Naming Pattern:**
```
feature/description
bugfix/issue-description
refactor/area-to-refactor
docs/documentation-update
```

**Commit Message Convention:**
```
type: description

Examples:
feat: add new feature
fix: resolve specific issue
refactor: extract reusable component
docs: update documentation
test: add test coverage
```

## Development Workflow

### Step-by-Step Development Process

1. **Understand Current State**
   ```bash
   # Always start here
   find app -name "*.rb" | xargs grep -l "class\|module" | head -10
   cat app/models/*.rb
   cat config/routes.rb
   ```

2. **Plan Changes**
   - Review existing similar functionality
   - Identify patterns to follow
   - Plan impact on existing code

3. **Implement Following Patterns**
   - Match existing code style
   - Use established naming conventions
   - Follow current architectural patterns

4. **Test Thoroughly**
   ```bash
   bundle exec rspec
   bundle exec rubocop
   # Manual testing of affected features
   ```

5. **Document Changes**
   - Update relevant documentation
   - Add tests for new functionality
   - Update code comments if needed

### Common Pitfalls to Avoid

- **Don't assume model relationships** - always check current associations
- **Don't break existing functionality** - test all affected features
- **Don't ignore current patterns** - follow established conventions
- **Don't skip testing** - ensure all tests pass
- **Don't forget documentation** - keep code readable and documented

---

## ⚠️ CRITICAL REMINDER

**This document provides PATTERNS and GUIDELINES, not a snapshot of current code.**

**Every time you work on this project:**
1. **Read the current codebase first**
2. **Understand existing implementations**
3. **Follow current patterns and conventions**
4. **Test changes thoroughly**
5. **Update this document if patterns change**

The codebase evolves - always verify current state before making assumptions!
