require 'spec_helper'

describe VinValidator, type: :model do

  let(:klass) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :number, :model
      validates :number, vin: true
    end
  end

  subject { klass.new }

  context 'when VIN number is valid' do
    it { should allow_value('1GT424C80BF201935').for(:number) }
    it { should allow_value('WBA3A5C57FF481656').for(:number) }
    it { should allow_value('1RF120617X2082282').for(:number) }
    it { should allow_value('2C8GP54L63R116324').for(:number) }
    it { should allow_value('1GMDU23E8YD123781').for(:number) }
    it { should allow_value('WA1VMAFEXED017739').for(:number) }
    it { should allow_value('1J8GK58KX4W196620').for(:number) }
    it { should allow_value('1XKDDR9X9WR796878').for(:number) }
    it { should allow_value('JH2RC3601TM672886').for(:number) }
    it { should allow_value('1GNEC13ZX5J176026').for(:number) }
  end

  context 'when VIN is too short' do
    it { should_not allow_value('1GNEC13ZX5J17602').for(:number) }
  end

  context 'when VIN is too long' do
    it { should_not allow_value('JH2RC3601TM6728861').for(:number) }
  end

  context 'when VIN contains invalid characters' do
    it { should_not allow_value('JH2RC360ITM6728861').for(:number) }
  end

  context 'when VIN checksum is incorrect' do
    it { should_not allow_value('1GNEC13XX5J176026').for(:number) }
  end

  context 'when VIN is null' do
    it { should allow_value(nil).for(:number) }
  end

  context 'when VIN is empty string' do
    it { should allow_value('').for(:number) }
  end

  context 'when VIN is a number' do
    it { should_not allow_value(12).for(:number) }
  end


end
