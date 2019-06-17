class GamesController < ApplicationController

  before_action :set_game, except: :create_game

  def create_game
    questions_ids = Question.order("RANDOM()").limit(10).map(&:id)
    @game = Game.create(questions: questions_ids, question_number: 0, score: 0)

    redirect_to show_game_path(@game)
  end

  def show_game
    @question = Question.find(@game.questions[@game.question_number]) if @game.question_number < 10
  end

  def next_question
    if params[:option].present?
      @question = Question.find(@game.questions[@game.question_number])
      @game.score += 1 if params[:option] == @question.answer
      @game.question_number += 1

      if @game.save
        redirect_to show_game_path(@game)
      end
    else
      redirect_to show_game_path(@game)
    end
  end

  private
  def set_game
    @game = Game.friendly.find(params[:id])
  end

end
