class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = string.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index.flat_map do |row, row_index|
      row.each_with_index
         .select { |elem, column_index| saddle?(elem, row: row_index, column: column_index) }
         .map { |_, c| [row_index, c] }
    end
  end

  private

  def saddle?(elem, row: 0, column: 0)
    elem == rows[row].max && elem == columns[column].min
  end
end
