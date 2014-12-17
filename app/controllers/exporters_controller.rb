class ExportersController < ApplicationController
  def index
    puts 'Hello'
  end
  def create
    puts 'Hello'
    file_data = params[:file_contents][:xml_file]
    # if file_data.respond_to?(:read)
    #   xml_contents = file_data.read
    # elsif file_data.respond_to?(:path)
    #   xml_contents = File.read(file_data.path)
    # else
    #   logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
    # end
    #
    # xml_contents
    s = Roo::OpenOffice.new(file_data.path, file_warning: :ignore)
    @rows = []
    (1..s.last_row).each do |i|
      @rows << s.row(i).first unless s.row(i).first.blank?
    end
    # redirect_to '/output'
  end

  def output_xml

  end
  def download
    send_file 'output.xml', :type=>"application/xml", :x_sendfile=>true
  end
end
