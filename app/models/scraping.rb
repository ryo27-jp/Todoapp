
  require 'mechanize'

    agent = Mechanize.new
    page = agent.get("https://www.j-cg.com/")
    elements = page.search('li.list')

    puts elements