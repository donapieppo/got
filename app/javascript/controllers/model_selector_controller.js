import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { vendorToModels: Object }

  connect() {
    this.show_vendor_printers();
    // console.log(this.vendorToModelsValue);
  }

  change(event) {
    console.log("changed printer_vendor");
    document.querySelector("#printer_printer_model_id option:checked").selected = false;
    this.show_vendor_printers();
  }

  hide_all() {
    document.querySelectorAll("#printer_printer_model_id option").forEach ((x) => (x.style.display = "none"));
  }

  show_vendor_printers() {
    var vendor = document.querySelector("#printer_vendor option:checked");
    console.log(`Changed -> ${vendor.value}`);
    var models = this.vendorToModelsValue[parseInt(vendor.value)];

    this.hide_all();
    models.forEach((i) => {
      document.querySelectorAll(`#printer_printer_model_id option[value="${i}"]`).forEach ((x) => (x.style.display = "block"))
    });
  }
}

