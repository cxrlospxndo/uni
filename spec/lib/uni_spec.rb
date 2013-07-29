# encoding: utf-8
require 'spec_helper'
describe 'Uni' do
  
  describe '#codigo_Uni' do
    context 'param is String' do
      it 'returns a String' do
        Uni::codigo_uni('20072531').should be_an_instance_of String
      end
      it 'returns "20072531G" for 20072531' do
        Uni::codigo_uni('20072531').should eql '20072531G'
      end
      it 'returns "19100003B" for 19100003' do
        Uni::codigo_uni('19100003').should eql '19100003B'
      end
      it 'returns "20090435F" for 20090435' do
        Uni::codigo_uni('20090435').should eql '20090435F'
      end
    end

    context 'param is Fixnum' do
      it 'returns a String' do
        Uni::codigo_uni(20072531).should be_an_instance_of String
      end
      it 'returns "20072531G" for 20072531' do
        Uni::codigo_uni(20072531).should eql '20072531G'
      end
      it 'returns "19100003B" for 19100003' do
        Uni::codigo_uni(19100003).should eql '19100003B'
      end
      it 'returns "20090435F" for 20090435' do
        Uni::codigo_uni(20090435).should eql '20090435F'
      end
    end

  end
  describe '#fast_Uni' do
    before(:all) { Uni.initialize }

    it 'initialize memory' do
      Uni.initialize.should eql 'memoria inicializada'
    end

    context 'param is String' do
      it 'returns a String' do
        Uni::fast_uni('20072531').should be_an_instance_of String
      end
      it 'returns "20072531G" for 20072531' do
        Uni::fast_uni('20072531').should eql '20072531G'
      end
      it 'returns "19100003B" for 19100003' do
        Uni::fast_uni('19100003').should eql '19100003B'
      end
      it 'returns "20090435F" for 20090435' do
        Uni::fast_uni('20090435').should eql '20090435F'
      end
    end

    context 'param is Fixnum' do
      it 'returns a String' do
        Uni::fast_uni(20072531).should be_an_instance_of String
      end
      it 'returns "20072531G" for 20072531' do
        Uni::fast_uni(20072531).should eql '20072531G'
      end
      it 'returns "19100003B" for 19100003' do
        Uni::fast_uni(19100003).should eql '19100003B'
      end
      it 'returns "20090435F" for 20090435' do
        Uni::fast_uni(20090435).should eql '20090435F'
      end
    end

  end
  describe '#data' do
    let(:regular) { Uni::data '20072531G' }
    let(:titulado) { Uni::data '19100003B' }
    let(:egresado) { Uni::data '19780540K' }
    let(:invalido) { Uni::data '20072531a' }

    it 'returns a Hash' do
      regular.should be_an_instance_of Hash
    end
    it 'returns an empty Hash if codigo is invalid' do
      invalido.should eql Hash.new
    end
    it 'returns "PANDO MORALES CARLOS ENRIQUE" for :nombre of 20072531G' do
      regular[:nombre].should eql 'PANDO MORALES CARLOS ENRIQUE'
    end
    it 'returns "ALUMNO REGULAR" for :situacion of 20072531G' do
      regular[:situacion].should eql 'ALUMNO REGULAR'
    end
    it 'returns "NO TIENE" for :medida_disciplinaria of 20072531G' do
      regular[:medida_disciplinaria].should eql 'NO TIENE'
    end
    it 'returns "ARIZOLA  FRANCISCO P" for :nombre of 19100003B' do
      titulado[:nombre].should eql 'ARIZOLA  FRANCISCO P'
    end
    it 'returns "TITULADO" for :situacion of 19100003B' do
      titulado[:situacion].should eql 'TITULADO'
    end
    it 'returns "INGENIERÍA CIVIL" for :especialidad of 19100003B' do
      titulado[:especialidad].should eql 'INGENIERÍA CIVIL'
    end
    it 'returns "1993 - 1" for :egreso of 19780540K' do
      egresado[:egreso].should eql '1993 - 1'
    end
  end
  describe '#notas' do
    xit 'returns an instance of Array' do
      [].should be_an_instance_of Array
    end
    xit 'returns an empty Array for invalid codigo and/or password'
    xit 'works with codigo as Fixnum or String'

    context 'every element of Array' do
      xit 'should be an instance of Hash'
      xit 'should have the keys :curso, :codigo, :seccion, :notas'
      xit 'should have an instance of String as value for :curso, :codigo, :seccion'
      xit 'should have an instance of Hash as value for :notas'
      context ':notas' do
        xit 'contains :practicas and :examenes'
        context ':practicas and :examenes' do
          xit 'contains an instance of Array'
          xit 'contains Strings as elements'
        end
      end
    end

  end
end