require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    columns = DB[:conn].execute("PRAGMA table_info(#{table_name})")
    names = []

    columns.each do |column|
    names << column["name"]
   end
    names.compact
  end

  def initialize(new_student = {})
    new_student.each do |name, grade|
    self.send("#{name}=", grade)
  end
  end
end
