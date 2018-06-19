module ApplicationHelper

  def current_organization
    @current_organization
  end

  # { "10": [[1,"4200"], [20, "4300"]] }
  def vendor_to_models_json(what)
    m = what.to_s.capitalize[0...-1] + "Model"
    m.constantize.order(:name).inject(Hash.new {|hash, key| hash[key] = []}) do |res, p| 
      res[p.vendor_id] << [p.id, p.name]
      res
    end.to_json.html_safe
  end

  # { "10": [1, 2, 4], 20: [20, 22] }
  def vendor_to_models_array(what)
    m = what.to_s.capitalize[0...-1] + "Model"
    m.constantize.order(:name).inject(Hash.new {|hash, key| hash[key] = []}) do |res, p| 
      res[p.vendor_id] << p.id
      res
    end.to_json.html_safe
  end

end
