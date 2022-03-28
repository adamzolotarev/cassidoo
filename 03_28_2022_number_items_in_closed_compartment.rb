# frozen_string_literal: true

# Given a string that represents items as asterisks (*)
# and compartment walls as pipes (|), a start index,
# and an end index, return the number of items in a closed compartment.

# Example:

# str = '|**|*|*'
# contained_items(str, 0, 5)
# 2

# contained_items(str, 0, 6)
# 3

# contained_items(str, 1, 7)
# 1

def contained_items(str, start_at, end_at)
  return 0 unless str&.length&.positive?

  candidate_count = 0
  actual_count = 0
  found_first_pipe = false

  str[start_at..end_at - 1].split(//) do |char|
    found_first_pipe ||= char == '|'
    next unless found_first_pipe

    case char
    when '*'
      candidate_count += 1
    when '|'
      actual_count += candidate_count
      candidate_count = 0
    end
  end
  actual_count
end

puts contained_items('|**|*|*', 0, 5)
puts contained_items('|**|*|*', 0, 6)
puts contained_items('|**|*|*', 1, 7)
