class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.enum_options_for_select(attr_name)
    self.send(attr_name.to_s.pluralize).map { |k, _| [self.human_attribute_enum_value(attr_name, k),k ] }.to_h
  end
  
  def enum_i18n(enum_name)
    retrun nil if self.send(enum_name).nil?
    I18n.t!("enums.#{self.model_name.i18n_key}.#{enum_name}.#{self.send(enum_name)}")
  end

  def self.enums_i18n(enum_name)
    self.send(enum_name.to_s.pluralize).map do |key, value|
      [I18n.t!("enums.#{self.model_name.i18n_key}.#{enum_name}.#{key}"), value]
    end.to_h
  end
  
  def self.human_attribute_enum_value(attr_name, value)
    return if value.blank?
    human_attribute_name("#{attr_name}.#{value}")
  end
end
