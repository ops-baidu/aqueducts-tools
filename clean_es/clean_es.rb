#!/usr/bin/env ruby

# dongfang#gmail.com
# 2014年 07月 11日 星期五 17:32:40 CST

def getProducts()
  begin
    require 'rest-client'
    require 'json'
    response = RestClient.get "http://api.aqueducts.baidu.com/v1/products/"
    ret = JSON.parse(response)
    products = []
    ret.each do |r|
      products << r["name"]
    end
    return products
  rescue Exception
    return []
  end
end

def deleteESIndex(index)
    require 'rest-client'
    huabeiURL = "http://10.36.4.246:8200/#{index}/" #huabei es vip
    huadongURL = "http://10.202.6.12:8200/#{index}/" #huadong es vip
    begin
      RestClient.delete huabeiURL
      RestClient.delete huadongURL
    rescue Exception
    end
end

######################################
products = getProducts
products.each do |p|
  require 'date'
  now = Date.today
  (15..60).to_a.each do |i|
    index = "aqueducts_#{p}_#{(now - i).strftime("%Y-%m-%d")}"
    deleteESIndex(index)
  end
end
