begin
  require 'pry-nav'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.config.collision_warning = true
  #Pry.config.command_prefix = '%'
rescue LoadError => e
  warn "can't load pry-nav"
end
