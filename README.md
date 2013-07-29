## Uni
Simple interface de la [Orce](http://www.orce.uni.edu.pe/).
Permite visualizar informacion publica, validar codigo, obtener la letra del mismo y consultar notas del ultimo ciclo
## Instalacion
```bash
$ gem install uni
```
Una vez instalado el uso es simple, solo debes requerirlo
```ruby
require 'uni'
```
## Ejemplos de uso:
### Obtener la letra del codigo:
Usando el algoritmo de MOD11
```ruby
Uni.codigo_uni 19741084 # => "19741084H"
Uni.codigo_uni "19741084" # => "19741084H"
```
### Validar codigo
```ruby
Uni.valid? "19741084K" # => false
Uni.valid? "20072531g" # => true
```
### Consultar informacion basica:
Tambien llamada informacion publica
```ruby
Uni.data "19741084H"
# => {:codigo=>"19741084H", :nombre=>"...", :facultad=>"...", ...}
```
### Consultar cursos, seccion, evaluaciones, calificaciones, etc
Se require conocer el codigo y password del alumno(regular).
```ruby
codigo = "20152015"
password = "99999" 
notas = Uni.notas codigo, password
```
Retorna un Array de Hashes, cada Hash corresponde a un curso. Si la informacion proporcionada es invalida, retornara un Array.new
```ruby
notas[0]
# => { :curso => "Geometria Analitica", :codigo => "CB102", :seccion => "U",
#   :notas => {:practicas=>[...], :examenes=>[...]}}
notas[0][:notas][:practicas][2]
# => ["PRACTICA 3", "18", "--", "16.13%"]
notas[0][:notas][:examenes][0]
# => ["EXAMEN PARCIAL", "08", "--", "32.35%"]
```
## Ideas/problemas/uso
* TODO: Clase alumno, Uni.sample, filtrar, cambiar de nombre a la gema
* Sugerencias, dudas o problemas en la repo([issues](https://github.com/cxrlospxndo/uni/issues)) o en su defecto a mi [email](mailto:cxrlospxndo@gmail.com).
* De momento lo mas cool que he hecho con esta gema es obtener esta info [2013-I](http://goo.gl/hqNKI)
