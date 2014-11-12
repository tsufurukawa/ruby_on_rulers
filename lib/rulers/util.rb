module Rulers
  # This code is what's actually used by ActiveSupport
  # to convert CamelCase to snake_case
  def self.to_underscore(string)
    string.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end