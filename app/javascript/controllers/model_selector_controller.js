import { Controller } from "@hotwired/stimulus"

// check the vendor and update the available models
export default class extends Controller {
  // { "1": [173, 172, 136], "3": [1, 2, 22]
  static values = { vendorToModels: Object }
  static targets = [ "vendor", "model" ]

  connect() {
    this.show_vendor_printers();
    console.log(this.vendorToModelsValue);
    console.log(this.vendorTarget);
    console.log(this.modelTarget);
  }

  change(event) {
    console.log("changed vendor");
    this.modelTarget.querySelector("option:checked").selected = false;
    this.show_vendor_printers();
  }

  hide_all() {
    this.modelTarget.querySelectorAll("option").forEach ((x) => (x.style.display = "none"));
  }

  show_vendor_printers() {
    var vendor = this.vendorTarget.querySelector("option:checked");
    console.log(`Vendor checked: ${vendor.value}`);
    var models = this.vendorToModelsValue[parseInt(vendor.value)];

    this.hide_all();
    models.forEach((i) => {
      console.log(i);
      this.modelTarget.querySelectorAll(`option[value="${i}"]`).forEach ((x) => (x.style.display = "block"))
    });
  }
}

