class AddPaymentToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :payment, :datetime
  end
end
