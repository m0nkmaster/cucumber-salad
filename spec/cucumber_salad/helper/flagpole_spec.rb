require 'spec_helper'

describe Helper::Flagpole do
  
  before do
    Helper::Cookie.reset
  end
  
  it 'should set a flagpole' do
    Helper::Flagpole.set('testpole', 'ON')
    Helper::Cookie.all.first.should eql(['test-ZnAtdGVzdHBvbGU%3D', {:value => 'T04%3D', :options => {}}])
  end
  
end