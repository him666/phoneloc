require 'pp'
require 'nokogiri'
require 'open-uri'

class PhoneGetter

  def brands
    url = 'http://www.gsmarena.com/makers.php3'
    doc = Nokogiri::HTML(open(url))
    doc.css('.st-text a').map do |brand|
      brand[:href]
    end
  end

  def nav_index(brand)
    url = 'http://www.gsmarena.com/'
    doc = Nokogiri::HTML(open(url + brand))
    doc.css('.nav-pages a').map do |index|
      index[:href]
    end << brand
  end

  def phone_list(nav_page)
    url = 'http://www.gsmarena.com/'
    doc = Nokogiri::HTML(open(url + nav_page))
    doc.css('#review-body a').map do |phone|
      phone[:href]
    end
  end

  def phone(page)
    url = 'http://www.gsmarena.com/'
    doc = Nokogiri::HTML(open(url + page))
    model = doc.css('.specs-phone-name-title').text
    data1 = { model: model }
    table = doc.css('table tr')
    data = table.map do |table| # full info
      {"#{table.css('.ttl').text.gsub(' ', '').gsub('-','')}": table.css('.nfo').text}
    end.reduce Hash.new, :merge
    data.merge(data1)
  end

  def save_phone(data)
    data.delete_if { |key, value|
      !key.to_s.match(/[[:digit:]][a-zA-Z]/).nil? ||
          value == "" || key.to_s == ' ' || key.to_s == '' }
    data.delete(:' ')
    pp data
    Phone.create(data)
  end

  def run
    brands.each do |brand|
      nav_index(brand).each do |page|
       phone_list(page).each do |phone|
       data = phone(phone)
         save_phone(data)
       end
      end
    end
    data = phone('acer_liquid_jade_2-7956.php')
    save_phone(data)
  end

end
pg = PhoneGetter.new
pg.run
