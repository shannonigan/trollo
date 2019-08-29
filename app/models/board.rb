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

end