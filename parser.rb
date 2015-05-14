require 'open-uri'
require 'nokogiri'

class Parser

  def initialize(name:, url:, rows_path:, title_path:, place_path:, score_path:)
    @name = name
    @url = url
    @rows_path = rows_path
    @place_path = place_path
    @score_path = score_path
    @title_path = title_path
    cache_webpage!


  end

  def cache_webpage!
    @cache_webpage = Nokogiri::HTML(open(url)).css(rows_path)
  end

  attr_reader :name, :url, :rows_path, :title_path, :place, :score

end
