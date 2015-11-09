require 'irb/ext/save-history'

# awesome print
#begin
  #require 'awesome_print'
  #AwesomePrint.irb!
#rescue LoadError => err
  #warn "Couldn't load awesome_print: #{err}"
#end

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
