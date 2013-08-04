require 'mechanize'
require 'nokogiri'

require 'uni/params'
require 'uni/version'
require 'uni/public_info'
require 'uni/private_info'

module Uni
  # Ejemplo de uso de #codigo_uni, #fast_uni y #data
  # @return [Hash] informacion publica del alumno
  def beep
    puts Uni.codigo_uni 20072531
    Uni.initialize
    codigo = Uni::fast_uni 20072531
    data = Uni::data codigo
    puts data
  end
  ## cursos y notas
  #def top
  #  ...
  #end
end


