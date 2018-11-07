# frozen_string_literal: true

# Formats transaction into user-friendly format
class Display
  def statement(list)
    puts header
    list.each { |row| puts format_row(row) }
  end

  private

  def header
    "date || credit || debit || balance"
  end

  def format_row(row)
    "#{row[:date]} || #{row[:credit]} || #{row[:debit]} || #{row[:balance]}".squeeze(' ')
  end
end
