class Object
  # requires the file and then returns the constant if constant is found
  # if constant is not found, it raises an error
  # this ensures that, ex: QuotesController is inside the "quotes_controller.rb" file
  def self.const_missing(const)
    @looked_for ||= {}
    raise "Class not found: #{const.to_s}" if @looked_for[const]

    @looked_for[const] = 1
    require Rulers.to_underscore(const.to_s)
    klass = const_get(const)

    return klass if klass
    raise "Class not found: #{const.to_s}"
  end
end