# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Layouts for models should be in following order
  # Associations
  # enums
  # Validations
  # Callbacks
  # Scopes
  # class methods if any
  # methods
end
