namespace :got do
  desc "Show available toners from other organizations. "
  task show_gifts: :environment do
    gift_toner_model_ids = Toner.where(gift: true).select(:toner_model_id).map(&:toner_model_id)
    printer_model_ids    = Printer.select(:printer_model_id).map(&:printer_model_id)

    TonerModel.joins(:printer_models)
              .where('printer_models.id': printer_model_ids)
              .where(id: gift_toner_model_ids).each do |toner_model|
      p toner_model.toners.where(gift:true)
      p toner_model.printers
    end
  end
end

# TonerModel.joins(:printer_models)
#           .where('printer_models.id': printer_model_ids)
#           .where(id: gift_toner_model_ids)
#
#          SELECT `toner_models`.`id` AS t0_r0, `toner_models`.`vendor_id` AS t0_r1 
#            FROM `toner_models` 
#      INNER JOIN `printer_models_toner_models` 
#              ON `printer_models_toner_models`.`toner_model_id` = `toner_models`.`id` 
#      INNER JOIN `printer_models` 
#              ON `printer_models`.`id` = `printer_models_toner_models`.`printer_model_id` 
# LEFT OUTER JOIN `vendors` ON `vendors`.`id` = `toner_models`.`vendor_id` 
#           WHERE `printer_models`.`id` IN (1, 3, 3, 6, 6, 7, 7, 8, 8, 8, 9, 9, 9, 9, 11, 16, 17, 17, 17, 17, 24, 24, 24, 24, 25, 26, 26, 26, 26, 27, 28, 29, 29, 29, 29, 32, 32, 34, 34, 34, 35, 35, 43, 43, 43, 45, 54, 70, 70, 70, 70, 71, 71, 72, 73, 74, 75, 76, 76, 77, 78, 79, 80, 81, 87, 87, 89, 89, 89, 89, 99, 100, 101, 102, 103) 
#             AND `toner_models`.`id` IN (1, 19, 22, 23, 27, 28, 29, 30, 33, 34, 22)  
