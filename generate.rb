require 'csv'
require 'json'

PATH = 'data.csv'

CSV.foreach(PATH, :headers => true) {|r|
  f = {
    :type => :Feature,
    :properties => r.to_hash,
    :tippecanoe => {
      :layer => :address
    }
  }
  f[:properties].delete('point')
  f[:geometry] = {
    :type => :Point,
    :coordinates => [
      f[:properties].delete('Longitude').to_f,
      f[:properties].delete('Latitude').to_f
    ]
  }
  print "#{JSON.dump(f)}\n"
}

