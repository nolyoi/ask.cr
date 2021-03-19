class Avram::Migrator::DropTriggerStatement
  def initialize(@table_name : Symbol, @trigger_name : String)
  end

  def build
    <<-SQL
    DROP TRIGGER IF EXISTS #{@trigger_name} ON #{@table_name};
    SQL
  end
end
