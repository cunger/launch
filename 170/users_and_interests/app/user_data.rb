require 'yaml'

class UserData
  def initialize
    @users = load_data
  end

  def each(&block)
    @users.each do |user|
      block.call user
    end
  end

  def list
    @users
  end

  def list_without(user)
    @users - [user]
  end

  private

  def load_data
    YAML.load_file('app/users.yaml').map { |key, info|
      path = key.to_s
      name = path.capitalize
      User.new(path, name, info[:email], info[:interests])
    }
  end
end

User = Struct.new :path, :name, :email, :interests
