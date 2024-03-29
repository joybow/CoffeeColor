class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_attribute_enum_value(attr_name, value)
    return if value.blank?
    human_attribute_name("#{attr_name}.#{value}")
  end

  def human_attribute_enum(attr_name)
    self.class.human_attribute_enum_value(attr_name, self.send("#{attr_name}"))
  end

  def self.enum_options_for_select_for_value(attr_name)
    self.send(attr_name.to_s.pluralize).map { |k, v| [self.human_attribute_enum_value(attr_name, k), v] }.to_h
  end

  def self.enum_options_for_select(attr_name)
    self.send(attr_name.to_s.pluralize).map { |k, _| [self.human_attribute_enum_value(attr_name, k), k] }.to_h
  end
  
  def self.ransackable_associations(auth_object = nil)
    if Administrator === auth_object
      authrizable_ransackable_associations
    else
      raise "please implement ransackable_associations: #{self}"
    end
  end
end