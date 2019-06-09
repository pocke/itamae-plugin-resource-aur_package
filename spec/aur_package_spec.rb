require 'spec_helper'

describe package('ruby-build') do
  it { should be_installed }
end

describe package('yay') do
  it { should be_installed }
end

describe package('hub') do
  it { should be_installed }
end
