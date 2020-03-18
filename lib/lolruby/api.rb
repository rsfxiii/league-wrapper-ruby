# frozen_string_literal: true

require 'json'
require 'net/http'
require 'dotenv'

require_relative 'helper'

# Load .env & require necessary keys
Dotenv.load
Dotenv.require_keys('RIOT_KEY', 'RIOT_BASE_URI')

# Base API client - https://developer.riotgames.com/apis
class LeagueOfLegends
  BASE_URI = ENV['RIOT_BASE_URI']

  class << self
    def base_uri
      BASE_URI
    end

    def authorize_url(uri)
      url = URI(uri)
      params = { api_key: ENV['RIOT_KEY'] }
      url.query = URI.encode_www_form(params)
      url
    end

    def call(uri, pretty = true)
      result = Net::HTTP.get_response(uri)
      data = JSON.parse(result.body) if result.is_a?(Net::HTTPSuccess)

      # Display pretty data if toggled; enabled by default
      display_pretty_json(data) if pretty

      data
    end
  end

  # Access summoner's champion masteries
  class ChampionMastery
    class << self
      def endpoint
        '/lol/champion-mastery/v4'
      end

      def all(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-summoner/#{summoner_id}"
        )
      end

      def by_champion(summoner_id, champion_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-summoner/#{summoner_id}/by-champion/#{champion_id}"
        )
      end

      def score(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/scores/by-summoner/#{summoner_id}"
        )
      end
    end
  end

  # Access current free champion rotations
  class ChampionRotations
    class << self
      def endpoint
        '/lol/platform/v3'
      end

      def all
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          '/champion-rotations'
        )
      end
    end
  end

  # Access League Experience per queue, tier & division
  class LeagueExperience
    class << self
      def endpoint
        '/lol/league-exp/v4'
      end

      def retrieve(queue, tier, division)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/entries/#{queue}/#{tier}/#{division}"
        )
      end
    end
  end

  # Access Leagues by challenger, summoner, grandmaster, and all
  class Leagues
    class << self
      def endpoint
        '/lol/league/v4'
      end

      def by_challenger_queue(queue)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/challengerleagues/by-queue/#{queue}"
        )
      end

      def by_summoner(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/entries/by-summoner/#{summoner_id}"
        )
      end

      def all(queue, tier, division)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/entries/#{queue}/#{tier}/#{division}"
        )
      end

      def by_grandmaster_queue(queue)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/grandmasterleagues/by-queue/#{queue}"
        )
      end
    end
  end

  # Access shard statuses
  class ShardStatus
    class << self
      def endpoint
        '/lol/status/v3/shard-data'
      end

      def retrieve
        File.join(
          LeagueOfLegends.base_uri, endpoint
        )
      end
    end
  end

  # Access matches
  class Match
    class << self
      def endpoint
        '/lol/match/v4'
      end

      def by_id(match_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/matches/#{match_id}"
        )
      end

      def by_account(account_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/matchlists/by-account/#{account_id}"
        )
      end

      def timelines_by_id(match_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/timeslines/by-match/#{match_id}"
        )
      end

      def by_tournament_code(tournament_code)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/matches/by-tournament-code/#{tournament_code}/ids"
        )
      end

      def by_id_and_code(match_id, tournament_code)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/matches/#{match_id}/by-tournament-code/#{tournament_code}"
        )
      end
    end
  end

  # Access games that can be spectated
  class Spectator
    class << self
      def endpoint
        '/lol/spectator/v4'
      end

      def active_games(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/active-games/by-summoner/#{summoner_id}"
        )
      end

      def featured_games
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          '/featured-games'
        )
      end
    end
  end

  # Access Summoner data
  class Summoner
    class << self
      def endpoint
        '/lol/summoner/v4/summoners'
      end

      def by_account(account_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-account/#{account_id}"
        )
      end

      def by_name(summoner_name)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-name/#{summoner_name}"
        )
      end

      def by_puuid(puuid)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-puuid/#{puuid}"
        )
      end

      def by_id(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/#{summoner_id}"
        )
      end
    end
  end
end

API = {
  'ChampionMastery': LeagueOfLegends::ChampionMastery,
  'ChampionRotations': LeagueOfLegends::ChampionRotations,
  'Leagues': LeagueOfLegends::Leagues,
  'LeagueExperience': LeagueOfLegends::LeagueExperience,
  'ShardStatus': LeagueOfLegends::ShardStatus,
  'Match': LeagueOfLegends::Match,
  'Spectator': LeagueOfLegends::Spectator,
  'Summoner': LeagueOfLegends::Summoner
}.freeze

# url = API[:Summoner].by_name('SummonerName')
# authorized_url = LeagueOfLegends.authorize_url(url)
# LeagueOfLegends.call(authorized_url)
