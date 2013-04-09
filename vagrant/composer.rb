class ComposerCommand < Vagrant::Command::Base
  def execute
    ARGV.shift()
    puts `vagrant ssh -c "cd /var/www; composer #{ARGV.join(" ")}"`
  end
end

Vagrant.commands.register(:composer) { ComposerCommand }
