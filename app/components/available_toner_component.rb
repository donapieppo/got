# frozen_string_literal: true

class AvailableTonerComponent < ViewComponent::Base
  def before_render
    @cross_icon = helpers.dmicon('times-circle', size: 32)
  end

  def initialize(organization:)
    @organization = organization
    @available_toners = organization.available_toners
  end
end
