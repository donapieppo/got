require 'rails_helper'

RSpec.describe Organization, type: :model do

  let (:organization)  { FactoryBot.create(:organization) }
  let (:printer_model) { FactoryBot.create(:printer_model) }
  let (:toner_model)   { FactoryBot.create(:toner_model) }

  it "owns printers" do
    printer = FactoryBot.create(:printer, printer_model: printer_model, organization: organization)
    expect(organization.printers).to include(printer)
  end

  context "given printer in organization" do  
    let!(:printer) { FactoryBot.create(:printer, printer_model: printer_model, organization: organization) }

    it "#printer_model_ids consists of its model id]" do
      expect(organization.printer_model_ids).to eq([printer.printer_model_id])
    end

    context "given the printer has a compatible toner model in database" do
      before do 
        @toner_model = FactoryBot.create(:toner_model)
        printer.printer_model.toner_models << @toner_model
      end

      it "#usable_toner_models should include printer.toner_models" do
        expect(organization.usable_toner_models.to_a).to include(@toner_model)
      end 
    end

    context "given printer in other organization" do 
      let!(:printer2) { FactoryBot.create(:printer) }

      it "#printer_model_ids is still [printer.printer_model_id]" do
        expect(organization.printer_model_ids).to eq([printer.printer_model_id])
      end
    end
  end

  context "given toner in organization" do  
    let!(:toner) { FactoryBot.create(:toner, toner_model: toner_model, organization: organization) }

    it "#toner_model_ids is [toner.toner_model_id]" do
      expect(organization.toner_model_ids).to eq([toner.toner_model_id])
    end

    context "given toner in other organization" do 
      let!(:toner2) { FactoryBot.create(:toner) }

      it "#toner_model_ids is still [toner.toner_model_id]" do
        expect(organization.toner_model_ids).to eq([toner.toner_model_id])
      end
    end

    it "#unusable_toners includes this toner" do
      expect(organization.unusable_toners).to include(toner)
    end

    context "given a compatible printer for this toner" do
      before do
        @printer = FactoryBot.create(:printer, printer_model: printer_model, organization: organization)
        printer_model.toner_models << toner.toner_model
      end
       
      it "#unusable_toners does not includes this toner" do
        expect(organization.unusable_toners).not_to include(toner)
      end
    end
  end
end
