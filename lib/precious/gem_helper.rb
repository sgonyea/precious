require 'bundler'

if Bundler::VERSION >= '1.1'
  STDERR.puts "Warning! Precious has not been verified to work with Bundler point-releases, beyond 1.0. For everyone's safety, tasks are unavailable."

  module Precious
    class GemHelper
      def self.install_tasks(opts={})
        # Do nothing.
      end
    end
  end
else

  module Precious
    class GemHelper < Bundler::GemHelper
      def install
        desc "Build #{name}-#{version}.gem into the pkg directory"
        task 'build' do
          build_gem
        end

        desc "Build and install #{name}-#{version}.gem into system gems"
        task 'install' do
          install_gem
        end

        desc "Create tag #{version_tag} and push to your default, remote Git repository"
        task 'release' do
          release_git
        end
      end

      # Modify existing behavior, then call it something else.
      def release_gem
        guard_clean
        guard_already_tagged
        tag_version {
          build_gem
          git_push
        }
      end
      alias :release_git :release_gem

     protected
      # Kill the the rubygem_push method, just in case.
      def rubygem_push(path)
        # Do nothing.
      end
    end
  end

end
