# <%= paginate @parts %>
# <%= paginate @parts, window: 2 %> -->
# <%= paginate @parts, outer_window: 3 %>
# <%= paginate @parts, left: 1, right: 3 %>
# <%= page_entries_info @parts, entry_name: 'pages' %>


# STEP 1:
## include gem 'kaminari' in Gemfile
## bundle install

# STEP 2:
## set up config file via command line
## rails g kaminari:config
