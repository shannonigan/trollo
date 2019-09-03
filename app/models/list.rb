class List < ApplicationRecord
  belongs_to :board
  has_many :tasks


    # def self.all_lists(user_id, board_id)
    #   List.find_by_sql(
    #     "SELECT *
    #     FROM lists
    #     INNER JOIN boards ON board_id = lists.board_id
    #     ;")
    # end
  
  
end
