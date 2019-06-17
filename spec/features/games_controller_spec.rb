require "rails_helper"

describe "the progress of a new game", type: :feature do

  before :all do
    Question.create({
                        external_id: %q[771],
                        title: %q[Fill in the lyrics from Fresh Prince: "My parents went away on a weeks vacation and they left the keys to the brand new _____."],
                        category: %q[Hip Hop Music],
                        option1: %q[Porsche],
                        option2: %q[Car],
                        option3: %q[Chevy],
                        option4: %q[Ride],
                        answer: %q[1]
                    })
    Question.create({
                        external_id: %q[1027],
                        title: %q[What country was hip hop artist Drake born in?],
                        category: %q[Hip Hop Music],
                        option1: %q[South Africa],
                        option2: %q[Canada],
                        option3: %q[Australia],
                        option4: %q[United States],
                        answer: %q[2]
                    })
    @game = Game.create(questions: [1, 2], question_number: 0, score: 0)
  end

  it "creates a new game with slug" do
    visit create_game_path
    expect(current_path).to have_content 'gama-game-'
  end

  it "shows question" do
    visit show_game_path(@game)
    expect(page).to have_content 'Fill in the lyrics from Fresh Prince'
  end

  it "advances question" do
    visit show_game_path(@game)
    choose(option: 1)
    click_button 'btnNext'
    expect(page).to have_content 'What country was hip hop artist Drake born in?'
  end

end

describe "the ending of a game" do

  before :all do
    @game = Game.create(questions: [1, 2], question_number: 10, score: 0)
  end

  it "shows game score" do
    visit show_game_path(@game)
    expect(page).to have_content 'Your score was'
  end

end