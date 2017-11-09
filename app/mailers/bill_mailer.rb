class BillMailer < ApplicationMailer

    def send_bill(project,client)

        @project = project
        @client = client
        attachments["factura.pdf"] = WickedPdf.new.pdf_from_string(
            render_to_string(:pdf => "project",:template => 'pdf/bill.pdf.erb')
        )

        puts 'Enviado a -> ' + Client.find(@project.client_id).email

        self.instance_variable_set(:@lookup_context, nil)
        mail :subject => "Factura Ifreelance", :to => Client.find(@project.client_id).email
    end

    def example(project)
        #nextEmail = Client.find(project.client_id).email
        #puts 'hacia ' + nextEmail

        mail to: 'jgarzonj@unal.edu.co', subject: "Bienvenido a ifreelance"

    end
end
