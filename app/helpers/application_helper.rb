module ApplicationHelper

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

  def bootstrap_modal_div2
    raw %Q|
      <div class="modal fade" id="main-modal" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
            </div>
          </div><!-- .modal-content -->
        </div><!-- .modal-dialog -->
      </div><!-- .modal -->
|
  end
end
