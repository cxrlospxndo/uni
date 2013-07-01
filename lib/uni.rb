require "uni/version"
require "uni/public_info"

module Uni
  class Amijo
    # Ejemplo
    # @return [String] mensaje
    def mister
      'It works!'
    end
    # Ejemplo de uso de #codigo_uni
    # @return [String] codigo con su letra respectiva
    def step
      Uni::codigo_uni 20072531
    end
    # Ejemplo de uso de #fast_uni y #data
    # @return [Hash] informacion publica del alumno
    def beep
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
end


