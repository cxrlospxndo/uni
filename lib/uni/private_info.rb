module Uni
  # Falta refactorizar, aplicar buenas practicas, tests, etc
  # http://www.orce.uni.edu.pe/recordNotas.php?op=cursos&flag=notas
  # http://www.orce.uni.edu.pe/recordNotas.php?op=notas&tipo=Teoria&codcur=GP102&facul=I&codsec=V
  # http://www.orce.uni.edu.pe/recordNotas.php?op=notas&tipo=Practicas&codcur=GP102&facul=I&codsec=V
  # Se muestran las tablas tal cual, para evitar problemas en # de practicas, monografias, laboratorios, etc
  # Obtiene las notas de un alumno regular
  # @param codigo [String] Codigo del alumno # "20152015G"
  # @param password [String] password de orce # "12345"
  # @return [Array] Notas del ciclo
  def self.notas codigo, password
    cursos = []

    agent = Mechanize.new
    params = {'txtusu' => codigo, 'txtcla' => password}
    agent.post( URL + "logeo.php", params)
    agent.get URL + "recordNotas.php?op=cursos&flag=notas"
    pag = agent.page
    a=[]
    pag.parser.css('tr.fila td').each do |f|
      a << f.text
    end

    n = a.size/5

    (1..n).each do |i|
      ans = { curso: "", codigo: "", seccion: "", notas: {} }
      ind = (i-1)*5
      curso = a[ind.. ind+4]
      ans[:codigo] = curso[0]
      ans[:curso] = curso[1]
      ans[:seccion] = curso[2]

      practicas = obtener_notas_de "Practicas", ans[:codigo], ans[:seccion], agent
      examenes = obtener_notas_de "Teoria", ans[:codigo], ans[:seccion], agent

      ans[:notas] = { practicas: practicas, examenes: examenes}
      cursos << ans
    end
    cursos
  end
  # Obtiene las notas de un curso por tipo de evaluacion (practicas, teoria)
  # @return [Array] Nota del curso

  def self.obtener_notas_de evaluacion, codigo, seccion, agent
    agent.get URL+"recordNotas.php?op=notas&tipo=#{evaluacion}&codcur=#{codigo}&facul=I&codsec=#{seccion}"
    pag_evaluacion = agent.page

    evaluacion=[]
    pag_evaluacion.parser.css("tr td").each_slice(4) do |f|
      ans = []
      f.each do |c|
        ans << c.content.gsub(/\u00a0/, '') #&nbsp
      end
      evaluacion<<ans
    end
    evaluacion.delete_at(0)
    evaluacion
  end
end