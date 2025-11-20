bind -M insert ctrl-y accept-autosuggestion
bind -M insert ctrl-n forward-word

function fish_user_key_bindings
  fish_vi_key_bindings --no-erase insert
end
