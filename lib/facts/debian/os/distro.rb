# frozen_string_literal: true

module Facter
  module Debian
    class OsLsbRelease
      FACT_NAME = 'os.distro'

      def call_the_resolver
        distro = {
          'codename' => resolver('Codename'),
          'description' => resolver('Description'),
          'id' => resolver('Distributor ID'),
          'release' => {
            'full' => Resolvers::DebianVersionResolver.resolve(:full),
            'major' => Resolvers::DebianVersionResolver.resolve(:major),
            'minor' => Resolvers::DebianVersionResolver.resolve(:minor)
          }
        }

        ResolvedFact.new(FACT_NAME, distro)
      end

      def resolver(key)
        Resolvers::LsbReleaseResolver.resolve(key)
      end
    end
  end
end