# coding: utf-8
require 'selenium-webdriver'
require "pp"
USER_AGENT = "Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53"
capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs('phantomjs.page.settings.userAgent' => USER_AGENT)
driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities

driver.get("https://members.lovelive-sifac.jp/mypage/login")

element = driver.find_element(:id, "sqexid")
element.send_keys("dareka@tasukete.com")
element = driver.find_element(:id, "password")
element.send_keys("chottomattete")
element.submit

us = ['"穂乃果"', '"絵里"', '"ことり"', '"海未"', '"凛"', '"真姫"', '"希"', '"花陽"', '"にこ"']
us.each_with_index do |mem, i|
  lvs = {}
  driver.navigate.to("https://members.lovelive-sifac.jp/custom/memberstatus/setting?c=#{i + 1}")

  driver.find_elements(:tag_name => "td").each do |td|
    unless (fsxss = td.find_elements(:class_name => "fsxs")).empty?
      num = td.find_element(:tag_name => "input").attribute("value")
      fsxss.each do |fs|
        if fs.text.match(/\d{1,2}/) != nil
          lvs["#{num}"] = fs.text.match(/(\d{1,2})/)[1]
        end
      end
    end
  end
  str = lvs.sort.map do |ary|
    ary[1]
  end
  str.unshift(mem)
  puts str.join(',')
  sleep 5
end
driver.quit
