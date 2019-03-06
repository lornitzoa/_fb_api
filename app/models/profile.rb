class Profile
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  else
    DB = PG.connect(:host => 'localhost', :port => 5432, :dbname => '_fb_api_development')
  end
  def self.all
    results = DB.exec(
      <<-SQL
        SELECT user_id, birthday, image, bio
        FROM profiles
      SQL
    )
    return results.map do |result|
      {
        'user_id' => result['user_id'].to_i,
        'birthday' => result['birthday'],
        'image' => result['image'],
        'bio' => result['bio']
      }
    end
  end

  def self.find(id)
    result = DB.exec(
      <<-SQL
        SELECT user_id, birthday, image, bio
        FROM profiles
        WHERE user_id = #{id}
      SQL
    )
    result = results.first
    return {
      'user_id' => result['user_id'].to_i,
      'birthday' => reslt['birthday'],
      'image' => result['image'],
      'bio' => result['bio']
    }
  end

  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO profiles
          (user_id, birthday, image, bio)
        VALUES
           ('#{opts['user_id']}', '#{opts['birthday']}', '#{opts['image']}', '#{opts['bio']}')
        RETURNING user_id, birthday, image, bio
      SQL
    )
    result = results.first
    return {
      'user_id' => result['user_id'].to_i,
      'birthday' => result['birthday'],
      'image' => result['image'],
      'bio' => result['bio']
    }
  end

  # def self.delete(id)
  #   restuls = DB.exec(
  #     <<-SQL
  #       DELETE FROM profiles WHERE id = #{id}
  #     SQL
  #   )
  #   return {
  #     'deleted': true
  #   }
  # end

  def self.update(id, opts)
    results = DB.exec(
      <<-SQL
        UPDATE profiles
        SET

          birthday='#{opts['birthday']}',
          image='#{opts['image']}',
          bio='#{opts['bio']}'
        WHERE user_id = #{id}
        RETURNING user_id, birthday, image, bio;
      SQL
    )
    result = results.first
    return {
      'user_id' => result['user_id'].to_i,
      'birthday' => result['birthday'],
      'image' => result['image'],
      'bio' => result['bio']
    }
  end


end
