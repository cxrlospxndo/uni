# encoding: utf-8
require 'spec_helper'
describe 'Uni' do

  context 'parameters' do
    it 'has correct orce''s url' do
      Uni::URL.should eql 'http://www.orce.uni.edu.pe/'
    end
    it 'has a collection of all posible situacion' do
      Uni::SITUACION.should be_an_instance_of Array
    end
  end

  describe '#valid?' do
    specify { Uni.valid?(20072531).should be_true }
    specify { Uni.valid?('20072531g').should be_true }
    specify { Uni.valid?('20072531a').should_not be_true }
  end

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
    let(:fixnum) { Uni.data 20072531 }
    let(:inv_fixnum) { Uni.data 2007253 }

    it 'returns a Hash' do
      regular.should be_an_instance_of Hash
    end
    it 'returns an empty Hash if codigo is nil' do
      Uni.data(nil).should eql Hash.new
    end
    it 'returns an empty Hash if codigo is invalid' do
      invalido.should eql Hash.new
      inv_fixnum.should eql Hash.new
    end
    it 'works with param as Fixnum' do
      fixnum[:nombre].should eql 'PANDO MORALES CARLOS ENRIQUE'
      fixnum[:situacion].should eql 'ALUMNO REGULAR'
      fixnum[:medida_disciplinaria].should eql 'NO TIENE'
    end
    it 'returns data for "20072531G"' do
      regular[:nombre].should eql 'PANDO MORALES CARLOS ENRIQUE'
      regular[:situacion].should eql 'ALUMNO REGULAR'
      regular[:medida_disciplinaria].should eql 'NO TIENE'
    end
    it 'returns data for "19100003B"' do
      titulado[:nombre].should eql 'ARIZOLA  FRANCISCO P'
      titulado[:situacion].should eql 'TITULADO'
      titulado[:especialidad].should eql 'INGENIERÍA CIVIL'
    end
    it 'returns "1993 - 1" for :egreso of "19780540K"' do
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