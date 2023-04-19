class Maze
  def initialize(width, height)
    @width = width
    @height = height
    @maze = Array.new(height * 2 + 1) { Array.new(width * 2 + 1, "#") } # Correction de la faute de frappe 'ne' -> 'new'

    create_maze(1, 1)
    add_entry_exit
    display_maze
  end

  private

  def create_maze(x, y)
    directions = [[x, y - 2], [x, y + 2], [x - 2, y], [x + 2, y]].shuffle

    directions.each do |new_x, new_y|
      if new_y.between?(1, @height * 2) && new_x.between?(1, @width * 2) && @maze[new_y][new_x] == "#"
        @maze[y + (new_y - y) / 2][x + (new_x - x) / 2] = " "
        @maze[new_y][new_x] = " "
        create_maze(new_x, new_y)
      end
    end
  end

  def add_entry_exit # Correction de la faute de frappe 'ntry' -> 'entry'
    @maze[1][0] = " "
    @maze[@height * 2 - 1][@width * 2] = " "
  end

  def display_maze
    @maze.each { |row| puts row.join } # Correction de la faute de frappe 'eah' -> 'each'
  end
end

Maze.new(10, 10)