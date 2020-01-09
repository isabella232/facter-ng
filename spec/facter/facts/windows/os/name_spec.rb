# frozen_string_literal: true

describe 'Windows OsName' do
  context '#call_the_resolver' do
    let(:value) { 'windows' }
    subject(:fact) { Facter::Windows::OsName.new }

    before do
      allow(Facter::Resolvers::Kernel).to receive(:resolve).with(:kernel).and_return(value)
    end

    it 'calls Facter::Resolvers::Kernel' do
      expect(Facter::Resolvers::Kernel).to receive(:resolve).with(:kernel)
      fact.call_the_resolver
    end

    it 'returns operating system name fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Array).and \
        contain_exactly(an_object_having_attributes(name: 'os.name', value: value),
                        an_object_having_attributes(name: 'operatingsystem', value: value, type: :legacy))
    end
  end
end
