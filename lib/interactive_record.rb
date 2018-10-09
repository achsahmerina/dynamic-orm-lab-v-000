require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql = "PRAGMA info(#{table})"
    DB[:conn].results_as_hash = true

    info = DB[:conn].execute(sql)
    columns = []

    info.each do |column|
    columns  << column["name"]
    end
    columns.compact
  end
end
