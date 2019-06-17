class GamesController < ApplicationController

  before_action :set_game, only: :show_game

  def create_game
    questions_ids = Question.order("RANDOM()").limit(10).map(&:id)
    @game = Game.create(questions: questions_ids, question_number: 0, score: 0)

    redirect_to show_game_path(@game)
  end

  def show_game
    @question = Question.find(@game.questions[@game.question_number])
  end

  private
  def set_game
    @game = Game.friendly.find(params[:id])
  end

end
