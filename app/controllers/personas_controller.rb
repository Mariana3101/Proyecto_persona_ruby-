class PersonasController < ApplicationController
  before_action :set_persona, only: %i[ show edit update destroy ]

  # GET /personas or /personas.json
  def index
   
    @personas = Persona.select("id, nombre, apellido, dni, fecha_de_nacimiento, strftime('%m', fecha_de_nacimiento) as mes, cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', fecha_de_nacimiento ) as int) as edad").order("mes")
    promedioEdades
  end

  def promedioEdades
    suma = 0
    @personas.each do |pers|
      suma = suma + pers.edad
    end
    @promedioEdades = (suma.to_f / @personas.all.size).round(2)
  end
  
  # GET /personas/1 or /personas/1.json
  def show
    age = Date.today.year - @persona.fecha_de_nacimiento.year
    
    if (Date.today.month < @persona.fecha_de_nacimiento.month)
      age -= 1
    end
    @edad = age
    
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas or /personas.json
  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: "La Persona ha sido creada correctamente." }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1 or /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: "La persona ha sido modificada con exito." }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1 or /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: "La Persona ha sido eliminada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persona_params
      params.require(:persona).permit(:nombre, :apellido, :fecha_de_nacimiento,:dni)
    end

  
end
