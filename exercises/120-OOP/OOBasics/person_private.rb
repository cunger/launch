class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret

  def undress
    puts "Oh!"
  end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person1.share_secret # `share_secret` is public. it calls `secret`, which is private but accessible within the class (i.e. when being called).
person1.undress      # `undress` is private, i.e. cannot be called from outside the class.
