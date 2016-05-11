require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './trainer' )

class Gym

  attr_accessor( :name, :city, :leader )
  attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @city = options[ 'city' ]
    @leader = options[ 'leader' ]
  end

  def save(  )
    sql =
    "INSERT INTO gyms ( name, city, leader )
    VALUES( '#{@name}', '#{@city}', '#{@leader}' )
    RETURNING * ;"
    gym = SqlRunner.run( sql )[0]
    result = Gym.new( gym )
    return result
  end

  def self.all(  )
    sql = "SELECT * FROM gyms"
    gyms = SqlRunner.run( sql )
    return gyms.map { | gym | Gym.new( gym ) }
  end

  def update(  )
    sql =
    "UPDATE gyms
      SET name = '#{@name}',
          city = '#{@city}',
          leader = '#{@leader}',
     WHERE id = #{@id};
     RETURNING *;"
    SqlRunner.run( sql )
  end

  def delete()
    sql =
    "DELETE FROM gyms
    WHERE id = #{@id}
    RETURNING *;"
    SqlRunner.run( sql )
  end

end
