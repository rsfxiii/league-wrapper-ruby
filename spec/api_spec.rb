# frozen_string_literal: true

require './lib/lolruby/api'

require 'rspec'

RSpec.describe LeagueOfLegends do
  context 'with the base client class' do
    it 'assert LeagueofLegends.base_uri value' do
      expect(LeagueOfLegends.base_uri).to eq('https://na1.api.riotgames.com')
    end
  end
end

RSpec.describe LeagueOfLegends::ChampionMastery do
  context 'with ChampionMastery endpoint' do
    it 'assert ChampionMastery.endpoint value' do
      expect(LeagueOfLegends::ChampionMastery.endpoint).to eq('/lol/champion-mastery/v4')
    end
  end
end

RSpec.describe LeagueOfLegends::ChampionRotations do
  context 'with ChampionRotations endpoint' do
    it 'assert ChampionRotations.endpoint value' do
      expect(LeagueOfLegends::ChampionRotations.endpoint).to eq('/lol/platform/v3')
    end
  end
end

RSpec.describe LeagueOfLegends::LeagueExperience do
  context 'with LeagueExperience endpoint' do
    it 'assert LeagueExperience.endpoint value' do
      expect(LeagueOfLegends::LeagueExperience.endpoint).to eq('/lol/league-exp/v4')
    end
  end
end

RSpec.describe LeagueOfLegends::Leagues do
  context 'with Leagues endpoint' do
    it 'assert Leagues.endpoint value' do
      expect(LeagueOfLegends::Leagues.endpoint).to eq('/lol/league/v4')
    end
  end
end

RSpec.describe LeagueOfLegends::ShardStatus do
  context 'with ShardStatus endpoint' do
    it 'assert ShardStatus.endpoint value' do
      expect(LeagueOfLegends::ShardStatus.endpoint).to eq('/lol/status/v3/shard-data')
    end
  end
end

RSpec.describe LeagueOfLegends::Match do
  context 'with Match endpoint' do
    it 'assert Match.endpoint value' do
      expect(LeagueOfLegends::Match.endpoint).to eq('/lol/match/v4')
    end
  end
end

RSpec.describe LeagueOfLegends::Spectator do
  context 'with Spectator endpoint' do
    it 'assert Spectator.endpoint value' do
      expect(LeagueOfLegends::Spectator.endpoint).to eq('/lol/spectator/v4')
    end
  end
end

RSpec.describe LeagueOfLegends::Summoner do
  context 'with Summoner endpoint' do
    it 'assert Summoner.endpoint value' do
      expect(LeagueOfLegends::Summoner.endpoint).to eq('/lol/summoner/v4/summoners')
    end
  end
end
