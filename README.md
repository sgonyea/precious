# Precious: Keep your Bundler release tagging (<3), without pushing to RubyGems.org

This is a very simple gem that pulls in the Rake helpers from Bundler, but neuters the pushing to RubyGems.  Having Bundler tag-and-push your gems to Git is wonderful.  Having it push your internal-only gems to RubyGems, well, isn't.

## To use:

### In [your_gem].gemspec

        s.add_development_dependency 'precious'

### In your gem's Rakefile

        require 'repcious'

        # Replace 'Bundler::GemHelper.install_tasks' with:
        Precious::GemHelper.install_tasks

        # Recommended, but not required:
        task :release => :spec

## Caveats:

I've currently evaluating I might better test this, so please stay tuned. Currently, a test exists only to verify that it prints a warning if Bundler's version is untested with this gem.
