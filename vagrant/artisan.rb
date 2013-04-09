class ArtisanCommand < Vagrant::Command::Base
  def execute
    ARGV.shift()
    puts `vagrant ssh -c "php /var/www/artisan #{ARGV.join(" ")}"`
  end
end

Vagrant.commands.register(:artisan) { ArtisanCommand }
