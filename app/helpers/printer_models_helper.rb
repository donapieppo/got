module PrinterModelsHelper
  def show_printer_model_with_actions(printer_model)
    res = html_escape printer_model.name
    res += content_tag(:span, class: :actions) do
      link_to_edit("", edit_printer_model_path(printer_model)) +
      link_to(icon("plus"), new_printer_model_printer_path(printer_model), title: "add printer")
    end
  end
end
