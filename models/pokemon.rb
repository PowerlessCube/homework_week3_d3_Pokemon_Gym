require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './trainer' )

class Pokemon

attr_accessor( :name, :type_one, :trainer_id )
attr_reader( :id )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @type_one = options[ 'type_one' ]
    @trainer_id = options[ 'trainer_id' ].to_i
  end

#Read - Pokemon
  def save(  ) #instance methond - creates a pokemon.
    sql =
    "INSERT INTO pokemons ( name, type_one, trainer_id )
     VALUES( '#{@name}', '#{@type_one}', '#{@trainer_id}' )
     RETURNING * ;"
    pokemon = SqlRunner.run( sql )[0]
    result = Pokemon.new( pokemon )
    return result
  end

#Create - Pokemon
  def self.all(  )
    sql = "SELECT * FROM pokemons"
    pokemons = SqlRunner.run( sql )
    return pokemons.map { | pokemon | Pokemon.new( pokemon ) }
  end

#update - Pokemon
  def update(  )
    sql =
    "UPDATE trainers
      SET name = '#{@name}',
          type_one = '#{@type_one}',
          trainer_id = '#{@trainer_id}',
     WHERE id = #{@id};"
    SqlRunner.run( sql )[0]
  end

#delete Pokemon
  def delete()
    sql =
    "DELETE FROM pokemons
    WHERE id = #{@id}
    RETURNING *;"
    SqlRunner.run( sql )
  end



end
