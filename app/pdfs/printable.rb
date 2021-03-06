# encoding: utf-8
class Printable

  attr_accessor :headers
  attr_accessor :filename
  attr_accessor :title
  attr_accessor :data

  IMAGE_DIR = "#{Rails.root.to_s}/app/javascript/images"
  LOGO      = IMAGE_DIR + "/sigillo1.png"
  SPACE = "\xC2\xA0"

  def initialize(title = nil, orientation: :portrait)
    @pdf = Prawn::Document.new(page_size: 'A4', page_layout: orientation)
    @title = title
    @filename = title.gsub(' ', '_')
    @pdf.image LOGO, width: 54, height: 52, position: :center if File.exists?(LOGO)
    @pdf.move_down(5)
    @pdf.font_families.update("FreeFont" => {
      bold:   "/usr/share/fonts/truetype/freefont/FreeMonoBold.ttf",
      italic: "/usr/share/fonts/truetype/freefont/FreeMonoOblique.ttf",
      normal: "/usr/share/fonts/truetype/freefont/FreeMono.ttf"
    })
    @pdf.font "FreeFont", size: 10
    @pdf.text "ALMA MATER STUDIORUM - UNIVERSITÀ DI BOLOGNA", align: :center, style: :bold
    @pdf.move_down(10)
    @pdf.text @title, align: :center, style: :bold
    @pdf.move_down(10)
  end

  def toners
    # res['HP']['LaserJet 5'] = Array di organizations
    res = Hash.new
    max_lenght_name = 1
    Toner.where(gift: true).includes(:organization, toner_model: [printer_models: :vendor]).each do |toner|
      toner.toner_model.printer_models.order('printer_models.name').each do |printer_model|
        res[printer_model.vendor.name] ||= Hash.new
        res[printer_model.vendor.name][printer_model.name] ||= Array.new
        res[printer_model.vendor.name][printer_model.name] << " (#{toner.number} toner #{toner.toner_model.name} presso #{toner.organization.name})"
        max_lenght_name = printer_model.name.length if printer_model.name.length > max_lenght_name
      end
    end
    res.keys.sort.each do |vendor_name|
      @pdf.move_down(15)
      @pdf.text vendor_name, style: :bold, align: :center
      @pdf.move_down(15)
      res[vendor_name].keys.sort.each do |printer_model_name|
        @pdf.text SPACE + SPACE + "<b>" + printer_model_name.rjust(max_lenght_name) + "</b>" +
                  " <font size='8'>#{res[vendor_name][printer_model_name].map(&:to_s).join(', ')}</font>", inline_format: true
      end
    end
  end

  def render
    @pdf.render
  end
end

