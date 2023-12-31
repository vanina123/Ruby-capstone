require_relative '../game'

RSpec.describe Game do
  describe '#Game' do
    it 'returns the data of Game class' do
      game = Game.new('title', '2022-10-01', true, '2023-01-01', 'Horror', 'used')

      expect(game.title).to eq('title')
      expect(game.publish_date).to eq('2022-10-01')
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq('2023-01-01')
      expect(game.genre).to eq('Horror')
    end
  end
end
