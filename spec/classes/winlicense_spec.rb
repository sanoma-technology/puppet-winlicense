require 'spec_helper'

describe 'winlicense', :type => :class do
  context "Without license status" do
    let :params do
      { 
        :key => 'GCRJD-8NW9H-F2CDX-CCM8D-9D6T9',
      }
    end
    it {should contain_file('c:/Scripts')}
    it {should contain_file('c:/Scripts/SetWindowsKey.ps1').that_requires('File[c:/Scripts]')}
    it {should have_exec_resource_count(0)}
  end
  context "With license status" do
    let :params do
      {
        :key => 'GCRJD-8NW9H-F2CDX-CCM8D-9D6T9',
      }
    end
    let :facts do
      {
        :licensestatus => 'Unlicensed',
      }
    end
    it {should contain_exec('set_license')}
  end

  context "With license status Licensed" do
    let :params do
      {
        :key => 'GCRJD-8NW9H-F2CDX-CCM8D-9D6T9',
      }
    end
    let :facts do
      {
        :licensestatus => 'Licensed',
      }
    end
    it {should have_exec_resource_count(0)}
  end

end
