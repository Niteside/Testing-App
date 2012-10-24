class ServersController < ApplicationController
  # GET /servers
  # GET /servers.json

  require 'net/ping'
  require 'twitter'
  require 'rubygems'
  require 'net/smtp'

  include Net

  def index
    @servers = Server.all
    @port = Port.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servers }
    end
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    @port = Port.all
    @ports = Array.new


    @server.port.each do |x|
      @ports << x.port
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/new
  # GET /servers/new.json
  def new
    @server = Server.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find(params[:id])
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(params[:server])
    respond_to do |format|

      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render json: @server, status: :created, location: @server }
      else
        format.html { render action: "new" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servers/1
  # PUT /servers/1.json
  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to servers_url }
      format.json { head :no_content }
    end
  end

  #POST /servers/status


  def status
    @ports = Port.all
    @servers = Server.all
    @down_servers = Array.new

    for server in @servers
      for portnum in @ports
        if "#{server.id}" == "#{portnum.server_id}"
         if Ping::TCP.new("#{server.ip}", port = "#{portnum.port}").ping
          puts "#{server.name}"
         else
           @down_servers << "#{server.name} at #{server.ip} has port #{portnum.port} not responding."
          end
        end
      end
    end

    unless @down_servers.blank?
      ServerMailer.server_down_email(@down_servers).deliver
    end

    redirect_to "/"
  end

  def take_action


  end


end
