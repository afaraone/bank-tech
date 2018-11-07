# frozen_string_literal: true

# Formats transaction into user-friendly format
class Display
  def statement(list)
    puts header
    list.each { |row| puts format_row(row) }
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def format_row(row)
    "#{format_time(row[:date])} || #{format_number(row[:credit])} || "\
    "#{format_number(row[:debit])} || #{format_number(row[:balance])}".squeeze(' ')
  end

  def format_number(number)
    format('%.2f', number)
  rescue StandardError
    nil
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end
end
