class RemindWhosController < ApplicationController
  # GET /remind_whos
  # GET /remind_whos.json
  def index
    @remind_whos = RemindWho.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @remind_whos }
    end
  end

  # GET /remind_whos/1
  # GET /remind_whos/1.json
  def show
    @remind_who = RemindWho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @remind_who }
    end
  end

  # GET /remind_whos/new
  # GET /remind_whos/new.json
  def new
    @remind_who = RemindWho.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @remind_who }
    end
  end

  # GET /remind_whos/1/edit
  def edit
    @remind_who = RemindWho.find(params[:id])
  end

  # POST /remind_whos
  # POST /remind_whos.json
  def create
    @remind_who = RemindWho.new(params[:remind_who])

    respond_to do |format|
      if @remind_who.save
        format.html { redirect_to @remind_who, notice: 'Remind who was successfully created.' }
        format.json { render json: @remind_who, status: :created, location: @remind_who }
      else
        format.html { render action: "new" }
        format.json { render json: @remind_who.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /remind_whos/1
  # PUT /remind_whos/1.json
  def update
    @remind_who = RemindWho.find(params[:id])

    respond_to do |format|
      if @remind_who.update_attributes(params[:remind_who])
        format.html { redirect_to @remind_who, notice: 'Remind who was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @remind_who.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remind_whos/1
  # DELETE /remind_whos/1.json
  def destroy
    @remind_who = RemindWho.find(params[:id])
    @remind_who.destroy

    respond_to do |format|
      format.html { redirect_to remind_whos_url }
      format.json { head :no_content }
    end
  end
end
