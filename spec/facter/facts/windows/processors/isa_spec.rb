# frozen_string_literal: true

describe 'Windows ProcessorsIsa' do
  context '#call_the_resolver' do
    let(:value) { 'x86_64' }
    subject(:fact) { Facter::Windows::ProcessorsIsa.new }

    before do
      allow(Facter::Resolvers::Processors).to receive(:resolve).with(:isa).and_return(value)
    end

    it 'calls Facter::Resolvers::Processors' do
      expect(Facter::Resolvers::Processors).to receive(:resolve).with(:isa)
      fact.call_the_resolver
    end

    it 'returns isa fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Array).and \
        contain_exactly(an_object_having_attributes(name: 'processors.isa', value: value),
                        an_object_having_attributes(name: 'hardwareisa', value: value, type: :legacy))
    end
  end
end
