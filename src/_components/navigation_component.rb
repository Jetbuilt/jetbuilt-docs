class NavigationComponent < Bridgetown::Component
  attr_accessor :current_section

  def initialize(current_section, resources)
    @resources = resources
    self.current_section = current_section
  end

  def grouped_and_sorted_documentation_resources
    group_by(@resources, "section")
      .sort_by { |resources| documentation_sections_order.find_index(resources["name"]) }
  end

  private

  def documentation_sections_order
    ['category']
  end
end
