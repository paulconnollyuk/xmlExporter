module ExportersHelper
  def save_to_file(out)
    # save_path = Rails.public_path+'/output.xml'
    File.open('output.xml','wb') do |f|
      f.write(out)
    end
  end
end
