# frozen_string_literal: true

require_relative 'api'

class TFT < LeagueOfLegends
  class League
    class << self
      def endpoint
        '/tft/league/v1'
      end

      def challenger
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          '/challenger'
        )
      end

      def grandmaster
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          '/grandmaster'
        )
      end

      def master
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          '/master'
        )
      end

      def by_id(league_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/leagues/#{league_id}"
        )
      end

      def entries(tier, division)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/entries/#{tier}/#{division}"
        )
      end

      def entries_by_summoner(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/entries/by-summoner/#{summoner_id}"
        )
      end
    end
  end

  class Match
    class << self
      def endpoint
        '/tft/match/v1/matches'
      end

      def by_puuid(puuid)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-puuid/#{puuid}/ids"
        )
      end

      def by_id(match_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/#{match_id}"
        )
      end
    end
  end

  class Summoner
    class << self
      def endpoint
        '/tft/summoner/v1/summoners'
      end

      def by_account(account_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-account/#{account_id}"
        )
      end

      def by_puuid(puuid)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-puuid/#{puuid}"
        )
      end

      def by_summoner_id(summoner_id)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/#{summoner_id}"
        )
      end

      def by_name(summoner_name)
        File.join(
          LeagueOfLegends.base_uri, endpoint,
          "/by-name/#{summoner_name}"
        )
      end
    end
  end
end


# url = TFT::Summoner.by_name('SummonerName')
# authed = LeagueOfLegends.authorize_url(url)
# user = LeagueOfLegends.call(authed)

# next_url = TFT::League.entries_by_summoner(user['id'])
# authed = LeagueOfLegends.authorize_url(next_url)

# league_entries = LeagueOfLegends.call(authed)