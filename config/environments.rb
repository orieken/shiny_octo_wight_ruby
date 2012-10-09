require 'uri'
configure :development, :test do
  set :database, 'sqlite://releases.db'
  ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "releases.db"
  )
end

configure :production do
  # Database connection
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/releases')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end