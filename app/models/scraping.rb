
  require 'mechanize'

    agent = Mechanize.new
    page = agent.get("https://t.pia.jp/pia/search_all.do?kw=%E3%82%B2%E3%83%BC%E3%83%A0")
    elements = page.search('div.ticket_info_main li')

    puts elements