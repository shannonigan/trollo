class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all_boards(current_user)
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_board
    @board = Board.single_board(current_user.id, params[:id])
  end
end
