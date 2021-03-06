namespace :db do
  desc "Initiate forum"
  task :init_forum, [:forumname, :forumdesc, :username, :email, :password] => [:environment] do |t, args|
    print "Warning: This will destroy your entire forum. Continue? [y/N] "
    cont = STDIN.gets.chomp
    if cont.downcase == "y"
      Rake::Task['db:reset'].execute
      admin = User.new(username: args[:username],
                       email: args[:email],
                       password: args[:password],
                       password_confirmation: args[:password])
      admin.power_level = 3
      admin.save
      forum = Forum.create!(name: args[:forumname],
                        parent: nil,
                        required_power_level_to_view: 0, 
                        required_power_level_to_post: 3, 
                        forum_nav_id: 0,
                        description: args[:forumdesc])
      [:bold,:italics,:underline,:strikeout,:delete,:insert,
       :code,:size,:color,:orderedlist,:unorderedlist,:listitem,
       :definelist,:defineterm,:definition,:quote,:link,:image,:video,:email].each do |name|
        bbcode = BbCodeTags.new(name: name, enable_symbol: name)
        bbcode.enabled = true
        bbcode.custom = false
        bbcode.save
      end
    end
  end
end