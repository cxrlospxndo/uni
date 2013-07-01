Simple interface de la [Orce](http://www.orce.uni.edu.pe/).
Permite visualizar informacion publica, validar codigo, obtener la letra del mismo y consultar notas (password requerido)

Instalacion

```bash
    $ gem install uni
```

## Ejemplos de uso:

### Obtener la letra del codigo:

```ruby
    Uni::codigo_uni 19741084 # => "19741084H"
```
De ser necesario un calculo de la letra mas rapido, usar fast_uni, pero antes se debe invocar a initialize en la constante 'Uni'

```ruby
    Uni.initialize
    Uni::fast_uni 19741084 # => "19741084H"
```

### Consultar informacion basica:

```ruby
   Uni.data "19741084H" # => {:codigo=>"19741084H", :nombre=>"REYN...", :facultad=>"INGENIERÍA...", ..., :situacion=>"TITULADO"}
```

* Sugerencias, dudas o problemas aqui en la repo o en su defecto a mi [email](mailto:cxrlospxndo@gmail.com).
* De momento lo mas cool que he hecho con esto es obtener esta info [2013-I](http://goo.gl/hqNKI)

