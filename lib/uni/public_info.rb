# encoding: utf-8
require 'mechanize'
require 'nokogiri'

SITUACIONX = [ "SUSPENSION VOLUNTARIA", "ALUMNO REGULAR", "INACTIVO", "EN REGULARIZACION DE CURSO(S)", "EXPULSADO", "INACTIVO", "RETIRADO ", "FALLECIDO", "SUSPENSION ", "PROYECTO ESPECIAL ALUMNOS UNI"]
SITUACIONY = [ "TITULADO", "BACHILLER", "EGRESADO"]
module Uni
  SITUACION = SITUACIONX + SITUACIONY
  @x, @y = {}, {}
  @base = Mechanize.new
  # Inicializa las constantes @x y @y, para el uso de #fast_uni
  def self.initialize
    (1900..2014).each do |n|
      tmp, v, ans = n, 2123, 0
      4.times do 
        ans += (tmp%10)*(v%10)
        v /= 10
        tmp /= 10
      end
      @x[n] = ans
    end
    (0..9999).each do |n|
      tmp, v, ans = n, 4567, 0
      while( tmp != 0) 
        ans += (tmp%10)*(v%10)
        v /= 10
        tmp /= 10
      end
      @y[n] = ans
      "Ahora puedes usar #fast_uni"
    end
  end
  # Obtiene la letra del codigo (mas rapido que la implementacion #codigo_uni)
  # @see #codigo_uni
  # @param n [Fixnum] Un objeto Fixnum # 20072531
  # @return [String] El codigo con su respectiva letra # 20072531G
  def self.fast_uni n
    n.to_s + (65 + (@x[n/10000] + @y[n%10000])%11).chr
  end
  # Obtiene letra de codigo 
  # @see #fast_uni
  # @param n [Fixnum] Un objeto Fixnum # 20072531
  # @return [String] El codigo con su respectiva letra # 20072531G
  def self.codigo_uni n
      codigo = n.to_s
      v, ans = 21234567, 0
      8.times do 
          ans += (n%10)*(v%10)
          v /= 10
          n /= 10
      end
      codigo + (65 + ans%11).chr
  end
  # Obtiene informacion publica de un alumno # faculta, especialidad, pic:url, ciclo_relativo, etc
  # @param codigo [String] Un objeto String, que representa el codigo de un estudiante # 20072531G
  # @return [Hash] Informacion publica obtenida de la Orce

  def self.data codigo 
    agent = @base
    cod = codigo.upcase 
    url = "http://www.orce.uni.edu.pe/detaalu.php?id=#{cod}&op=detalu"

    page = agent.get url  
    a = []

    page.parser.css("tr td").each do |f|
      a << f.text
    end

    nombre = a[6].split("-").join(" ")
    return {} if nombre == ""
    info = { codigo: codigo, nombre: nombre }
    info[:facultad] = a[9]
    info[:especialidad] = a[12]
    info[:situacion] = a[15]
    info[:pic] = "http://www.orce.uni.edu.pe/" + page.parser.css("img")[3]['src']
    info[:pic] = "NO TIENE FOTO" if /nose/ =~ info[:pic]

    info[:ciclo_relativo] = page.parser.xpath('//td[@bgcolor!="#ffffff"]').last.text.gsub(/[.]/, '').to_i rescue " "

    if SITUACIONX.include? info[:situacion] 
      info[:egreso] = "" 
      info[:medida_disciplinaria] = a[18]
    else 
      info[:egreso] = a[17].length == 3 ? "" : a[17]
      info[:medida_disciplinaria] = a[20]
    end
    info
  end
end