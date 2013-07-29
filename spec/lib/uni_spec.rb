# encoding: utf-8
require 'spec_helper'
describe 'Uni' do
  
  describe '#codigo_Uni' do

    it "returns a String" do
      Uni::codigo_uni(20072531).should be_an_instance_of String
    end
    it "returns 20072531G for 20072531" do
      Uni::codigo_uni(20072531).should eql "20072531G"
    end
    it "returns 19100003B for 19100003" do
      Uni::codigo_uni(19100003).should eql "19100003B"
    end
    it "returns 20090435F for 20090435" do
      Uni::codigo_uni(20090435).should eql "20090435F"
    end
  end
  describe '#fast_Uni' do
    before(:all) do
      Uni.initialize
    end

    it "returns a String" do
      Uni::fast_uni(20072531).should be_an_instance_of String
    end
    it "returns 20072531G for 20072531" do
      Uni::fast_uni(20072531).should eql "20072531G"
    end
    it "returns 19100003B for 19100003" do
      Uni::fast_uni(19100003).should eql "19100003B"
    end
    it "returns 20090435F for 20090435" do
      Uni::fast_uni(20090435).should eql "20090435F"
    end
  end
  describe '#data' do

    before(:all) do
      @Uni = Uni::data "20072531G"
      @titulado = Uni::data "19100003B"
      @egreso = Uni::data "19780540K"
      @invalid = Uni::data "20072531A"
    end

    xit "returns a Hash if codigo valid" do
      @Uni.should be_an_instance_of Hash
    end
    it "returns an empty Hash if codigo invalid" do
      @invalid.should eql Hash.new
    end
    it "returns 'PANDO MORALES CARLOS ENRIQUE' for :nombre of 20072531G" do
      @Uni[:nombre].should eql "PANDO MORALES CARLOS ENRIQUE"
    end
    it "returns 'ALUMNO REGULAR' for :situacion of 20072531G" do
      @Uni[:situacion].should eql "ALUMNO REGULAR"
    end
    it "returns 'NO TIENE' for :medida_disciplinaria of 20072531G" do
      @Uni[:medida_disciplinaria].should eql "NO TIENE"
    end

    it "returns 'ARIZOLA  FRANCISCO P' for :nombre of 19100003B" do
      @titulado[:nombre].should eql "ARIZOLA  FRANCISCO P"
    end
    it "returns 'TITULADO' for :situacion of 19100003B" do
      @titulado[:situacion].should eql "TITULADO"
    end
    it "returns 'INGENIERÍA CIVIL' for :especialidad of 19100003B" do
      @titulado[:especialidad].should eql "INGENIERÍA CIVIL"
    end
    it "returns 1993 - 1 for :egreso of 19780540K" do
      @egreso[:egreso].should eql "1993 - 1"
    end
  end
  describe '#notas' do
    it 'returns hash of grades' do
      true.should eql true
    end
  end
end