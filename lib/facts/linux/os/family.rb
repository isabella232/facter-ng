module Facter
  module Linux
    class OsFamily
      FACT_NAME = 'os.family'.freeze
      @aliases = []

      def initialize(*args)
        @args = args
        puts 'Dispatching to resolve: ' + args.inspect
      end

      def call_the_resolver!
        fact = OsResolver.resolve(:family)
        { FACT_NAME => fact }
      end
    end
  end
end
