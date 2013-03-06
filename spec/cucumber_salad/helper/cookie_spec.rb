require 'spec_helper'

describe Helper::Cookie do
  
  before do
    Helper::Cookie.reset
  end
  
  it 'should set a cookie' do
    Helper::Cookie.add 'test', 'cookie'
    cookies = Helper::Cookie.all
    cookies.size.should eql(1)
    cookies.first.should eql(['test', {:value => 'cookie', :options => {}}])
  end
  
  it 'should allow setting the domain' do
    Helper::Cookie.add 'test', 'cookie', :domain => 'bbc.co.uk'
    Helper::Cookie.all.first.should eql(['test', {:value => 'cookie', :options => {:domain => 'bbc.co.uk'}}])
  end
  
  it 'should allow setting a BBC test cookie' do
    Helper::Cookie.add_test_cookie 'dateTimeNow', '2013-03-06'
    Helper::Cookie.all.first.should eql(['test-ZGF0ZVRpbWVOb3c%3D', {:value => 'MjAxMy0wMy0wNg%3D%3D', :options => {}}])
  end
  
end