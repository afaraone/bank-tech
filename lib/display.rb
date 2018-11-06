# frozen_string_literal: true

# Formats transaction into user-friendly format
class Display
  def statement(list)
    puts header
    list.each { |row| puts format_row(row) }
  end

  private

  COLUMNS = %i[date credit debit balance].freeze
  SEP = ' || '

  def header
    COLUMNS.join(SEP)
  end

  def format_row(row)
    output = []
    COLUMNS.each { |col| output << row[col] }
    output.join(SEP).squeeze(' ')
  end
end
