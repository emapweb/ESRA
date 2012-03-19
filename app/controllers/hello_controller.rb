class HelloController < ApplicationController

  def index
    output = HelloReport.new.to_pdf

    respond_to do |format|
      format.pdf do
        send_data output, :filename => "hello.pdf", 
                          :type => "application/pdf"
      end
    end
  end
end
