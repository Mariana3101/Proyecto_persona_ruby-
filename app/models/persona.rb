class Persona < ApplicationRecord
  validates :nombre, :presence => { :message => "Debe ingresar el nombre" }
  validates :apellido, :presence => { :message => "Debe ingresar el apellido" }
  validates :dni, format: { with: /\A\d+\z/, message: "Ingrese el número de documento." }
end
