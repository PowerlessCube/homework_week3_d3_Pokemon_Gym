require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './pokemon' )
require_relative( './gym' )

class Trainer

attr_accessor( :name, :discipline, :city, :gym_id  )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @discipline = options[ 'discipline' ]
    @city = options[ 'city' ]
    @gym_id = options[ 'gym_id' ].to_i
  end

  def save(  )#instances method - creates a trainer.
    sql =
      "INSERT INTO trainers (name, discipline, city, gym_id)
      VALUES( '#{@name}', '#{@discipline}', '#{@city}', '#{@gym_id}' )
      RETURNING * ;"
    trainer = SqlRunner.run( sql )[0]
    result = Trainer.new( trainer )
    return result
  end

  def self.all(  )
    sql = "SELECT * FROM trainers"
    trainers = SqlRunner.run( sql )
    return trainers.map { | trainer | Trainer.new( trainer ) }
  end

  def update(  )
    sql =
    "UPDATE trainers
      SET name = '#{@name}',
          discipline = '#{@discipline}',
          city = '#{@city}',
          gym_id = '#{@gym_id}',
     WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def delete()
    sql =
    "DELETE FROM trainers
    WHERE id = #{@id}
    RETURNING *;"
    SqlRunner.run( sql )
  end

end
