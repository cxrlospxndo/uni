## Uni
Simple interface de la [Orce](http://www.orce.uni.edu.pe/).
Permite visualizar informacion publica, validar codigo, obtener la letra del mismo y consultar notas (password requerido, pronto ...)
## Instalacion
```bash
$ gem install uni
```
## Ejemplos de uso:
### Obtener la letra del codigo:
Usando el algoritmo de MOD11
```ruby
Uni.codigo_uni 19741084 # => "19741084H"
```
De ser necesario un calculo de la letra mas rapido(memoria), usar fast_uni, pero antes se debe invocar a initialize en la constante 'Uni'
```ruby
Uni.initialize
Uni.fast_uni 19741084 # => "19741084H"
```
### Consultar informacion basica:
Tambien llamada informacion publica, que se obtiene al hacer busqueda de alumno.
```ruby
Uni.data "19741084H" # => {:codigo=>"19741084H", :nombre=>"...", :facultad=>"...", ...}
```
### Consultar cursos, seccion, evaluaciones, calificaciones, etc
Se require conocer el codigo y password del alumno(regular).
```ruby
codigo = "20152015"
password = "99999"
notas = Uni.notas codigo, password
```
Retorna un Array de Hashes, cada Hash corresponde a un curso
```ruby
puts notas[0]
# { :curso => "CALCULO RECONTRAVARIABLE", :codigo => "CB102", :seccion => "U",
#   :notas => {:practicas=>[["PRACTICA 1", "15", "--", "19.35%"], [...], ...],
#              :examenes=>[["EXAMEN PARCIAL", "13", "--", "35.48%"], ...]}}
```
## Ideas/problemas/uso
* TODO: Clase alumno, Uni.sample, filtrar, subir el modulo uni_private (cursos, notas, etc), cambiar de nombre a la gema
* Sugerencias, dudas o problemas aqui en la repo o en su defecto a mi [email](mailto:cxrlospxndo@gmail.com).
* De momento lo mas cool que he hecho con esta gema es obtener esta info [2013-I](http://goo.gl/hqNKI)

