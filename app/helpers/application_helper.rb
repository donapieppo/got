module ApplicationHelper

  # { "10": [[1,"4200"], [20, "4300"]] }
  def vendor_to_models_json(what)
    PrinterModel.order(:name).inject(Hash.new {|hash, key| hash[key] = []}) do |res, p| 
      res[p.vendor_id] << [p.id, p.name]
      res
    end.to_json.html_safe
  end

end
