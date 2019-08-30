class Board < ApplicationRecord
  belongs_to :user

  def self.all_boards(user_id)
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      WHERE b.user_id = user_id
      ;")
  end
  

  def self.single_board(user_id, board_id)
    Board.find_by_sql(["
    SELECT *
    FROM boards AS b
    WHERE b.user_id = ? AND b.id = ?
    ;", user_id, board_id]).first
  end

  def self.create_board(p, id)
    Board.find_by_sql(["
    INSERT INTO boards (name, priority, user_id, created_at, updated_at)
    VALUES (:name, :priority, :user_id, :created_at, :updated_at)
    ;", {
      name: p[:name],
      priority: p[:priority],
      user_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end

  def self.update_board(board_id, p)
    Board.find_by_sql(["
    UPDATE boards AS b
    SET name = ?, priority = ?, updated_at = ?
    WHERE b.id = ?
    ;", 
    p[:name], p[:priority], DateTime.now, board_id ])
  end

  def self.delete_board(id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
      WHERE b.id = ?
    ;", id])
  end

end